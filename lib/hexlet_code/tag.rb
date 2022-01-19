# frozen_string_literal: true

module HexletCode
  # How to use?
  # HexletCode::Tag.build('br')
  # <br>

  # HexletCode::Tag.build('img', src: 'path/to/image')
  # <img src="path/to/image">

  # HexletCode::Tag.build('input', type: 'submit', value: 'Save')
  # <input type="submit" value="Save">

  # Для парных тегов тело передается как блок
  # HexletCode::Tag.build('label') { 'Email' }
  # <label>Email</label>

  # HexletCode::Tag.build('label', for: 'email') { 'Email' }
  # <label for="email">Email</label>

  # HexletCode::Tag.build('div')
  # <div></div>
  class Tag
    def self.build(tag_name, params = {}, &body)
      raise "Unsupported tag" unless supported_tags.include?(tag_name)

      params_mapping = params.map { |k, v| %(#{k}="#{v}") }

      params_string = params_mapping.join(" ") unless params_mapping.empty?

      open_tag = "<#{[tag_name, params_string].compact.join(" ")}>"

      if paired_tags.include?(tag_name)
        close_tag = "</#{tag_name}>"
        "#{open_tag}#{body.call unless body.nil?}#{close_tag}"
      else
        open_tag
      end
    end

    def self.supported_tags
      paired_tags + unpaired_tags
    end

    def self.paired_tags
      %w[label div form]
    end

    def self.unpaired_tags
      %w[br hr img input]
    end
  end
end
