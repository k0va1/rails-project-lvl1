# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(tag_name, params = {}, &body)
      raise "Unsupported tag" unless supported_tags.include?(tag_name)

      params_mapping = params.map { |k,v| %Q(#{k}="#{v}") }

      params_string = params_mapping.join(" ") unless params_mapping.empty?

      open_tag = "<#{[tag_name, params_string].compact.join(" ")}>"

      if paired_tags.include?(tag_name)
        close_tag = "</#{tag_name}>"
        "#{open_tag}#{body.call}#{close_tag}"
      else
        open_tag
      end
    end

    def self.supported_tags
      paired_tags + unpaired_tags
    end

    def self.paired_tags
      %w[label div]
    end

    def self.unpaired_tags
      %w[br hr img]
    end
  end
end
