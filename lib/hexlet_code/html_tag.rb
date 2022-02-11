# frozen_string_literal: true

require_relative 'tag'

module HexletCode
  class HtmlTag < ::HexletCode::Tag
    class << self
      def build(tag_name, params = {})
        raise ::HexletCode::Error, "Unsupported tag: `#{tag_name}`" unless supported_tags.include?(tag_name)

        attributes_with_values = params.map { |k, v| %(#{k}="#{v}") }

        attributes_string = attributes_with_values.join(' ') unless attributes_with_values.empty?

        open_tag = "<#{[tag_name, attributes_string].compact.join(' ')}>"

        if paired_tags.include?(tag_name)
          close_tag = "</#{tag_name}>"
          "#{open_tag}#{yield if block_given?}#{close_tag}"
        else
          open_tag
        end
      end

      def supported_tags
        paired_tags + unpaired_tags
      end

      def paired_tags
        %w[label div form textarea]
      end

      def unpaired_tags
        %w[br hr img input]
      end
    end
  end
end
