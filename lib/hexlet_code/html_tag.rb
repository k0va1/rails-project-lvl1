# frozen_string_literal: true

require_relative "tag"

module HexletCode
  # How to use?
  # HexletCode::HtmlTag.build('br')
  # <br>

  # HexletCode::HtmlTag.build('img', src: 'path/to/image')
  # <img src="path/to/image">

  # HexletCode::HtmlTag.build('input', type: 'submit', value: 'Save')
  # <input type="submit" value="Save">

  # Для парных тегов тело передается как блок
  # HexletCode::HtmlTag.build('label') { 'Email' }
  # <label>Email</label>

  # HexletCode::HtmlTag.build('label', for: 'email') { 'Email' }
  # <label for="email">Email</label>

  # HexletCode::HtmlTag.build('div')
  # <div></div>
  class HtmlTag < ::HexletCode::Tag
    class << self
      def build(tag_name, params = {})
        raise ::HexletCode::Error "Unsupported tag: #{tag_name}" unless supported_tags.include?(tag_name)

        params_mapping = params.map { |k, v| %(#{k}="#{v}") }

        params_string = params_mapping.join(" ") unless params_mapping.empty?

        open_tag = "<#{[tag_name, params_string].compact.join(" ")}>"

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
