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
    class << self
      def build(tag_name, params = {}, &body)
        raise "Not implemented"
      end
    end
  end
end
