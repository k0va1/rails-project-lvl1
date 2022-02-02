# frozen_string_literal: true

module HexletCode
  # Build input tag by given type
  class InputTagBuilder
    attr_reader :template_class

    def initialize(template_class)
      @template_class = template_class
    end

    def call(field_name, value, params = {})
      type = params.delete(:as) || :input

      case type
      when :text
        textarea(field_name, value, **params)
      else
        input(field_name, value, **params)
      end
    end

    private

    def input(field_name, value, params = {})
      template_class.build('input', name: field_name.to_s, type: 'text',
                                    value: value, **params)
    end

    def textarea(field_name, value, params = {})
      cols = params.delete(:cols) || 20
      rows = params.delete(:rows) || 40

      template_class.build('textarea', cols: cols, rows: rows, name: field_name.to_s, **params) do
        value
      end
    end
  end
end
