# frozen_string_literal: true

module HexletCode
  # Build input tag by given type
  class InputTagBuilder
    attr_reader :template_class

    def initialize(template_class)
      @template_class = template_class
    end

    def call(field_name, value, params = {})
      type = params[:as] || :input
      params_for_tag = params.except(:as)

      case type
      when :text
        textarea(field_name, value, **params_for_tag)
      else
        input(field_name, value, **params_for_tag)
      end
    end

    private

    def input(field_name, value, params = {})
      template_class.build('input', name: field_name.to_s, type: 'text',
                                    value: value, **params)
    end

    def textarea(field_name, value, params = {})
      cols = params[:cols] || 20
      rows = params[:rows] || 40
      params_for_tag = params.except(:rows, :cols)

      template_class.build('textarea', cols: cols, rows: rows, name: field_name.to_s, **params_for_tag) do
        value
      end
    end
  end
end
