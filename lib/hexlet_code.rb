# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/html_tag'
require_relative 'hexlet_code/input_tag_builder'

# HexletCode is a DSL for building HTML forms in easy way.
module HexletCode
  class Error < StandardError; end

  class << self
    attr_accessor :template_type

    def root
      Pathname.new(File.expand_path('..', __dir__))
    end

    def form_for(object, params = {})
      @object = object
      @tags = []

      method = params.delete(:method) || 'post'
      action = params.delete(:url) || '#'

      template_class.build('form', action: action, method: method, **params) do
        yield(self) if block_given?

        # TODO: for haml & slim indentaion is important
        @tags.join
      end
    end

    def input(field_name, params = {})
      label = template_class.build('label', for: field_name.to_s) { field_name.to_s.capitalize }
      value = @object.public_send(field_name)

      @tags << label
      @tags << InputTagBuilder.new(template_class).call(field_name, value, **params)
    end

    def submit(value = 'Save')
      @tags << template_class.build('input', name: 'commit', type: 'submit', value: value)
    end

    def template_class(type: :html)
      case type
      when :html
        ::HexletCode::HtmlTag
      else
        raise ::HexletCode::Error 'Unsupported type for template'
      end
    end
  end
end
