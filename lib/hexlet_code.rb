# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"

module HexletCode
  class Error < StandardError; end

  def self.root
    Pathname.new(File.expand_path('../..', __FILE__))
  end
end
