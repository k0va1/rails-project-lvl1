# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"

# HexletCode is a DSL for building HTML forms in easy way.
module HexletCode
  class Error < StandardError; end

  def self.root
    Pathname.new(File.expand_path("..", __dir__))
  end

  def self.form_for(object, params = {})
    method = params[:method] || "post"
    action = params[:url] || "#"

    ::HexletCode::Tag.build("form", action: action, method: method, **params.except(:method, :url))
  end
end
