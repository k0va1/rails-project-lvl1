# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"

# HexletCode is a DSL for building HTML forms in easy way.
module HexletCode
  class Error < StandardError; end

  class << self
    def root
      Pathname.new(File.expand_path("..", __dir__))
    end

    def form_for(object, params = {})
      @object = object
      @tags = []

      method = params[:method] || "post"
      action = params[:url] || "#"

      ::HexletCode::Tag.build("form", action: action, method: method, **params.except(:method, :url)) do
        yield(self) if block_given?

        @tags.join("")
      end
    end

    def input(field_name, args = {})
      type = args[:as] || :input

      label = ::HexletCode::Tag.build("label", for: field_name.to_s) { field_name.to_s.capitalize }
      @tags << label
      @tags << if type == :text
        ::HexletCode::Tag.build("textarea", cols: "20", rows: "40", name: field_name.to_s) { @object.public_send(field_name) }
      else
        ::HexletCode::Tag.build("input", name: field_name.to_s, type: "text", value: @object.public_send(field_name))
      end
    end

    def submit(value = "Save")
      @tags << ::HexletCode::Tag.build("input", name: "commit", type: "submit", value: value)
    end
  end
end
