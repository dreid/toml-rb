module TOML
  class Keygroup
    attr_accessor :nested_keys

    def initialize(nested_keys)
      @nested_keys = nested_keys
    end

    def navigate_keys(hash)
      @nested_keys.each do |key|
        hash[key] = {} unless hash[key]
        hash = hash[key]
      end

      hash
    end
  end
end

# Used in toml.citrus
module Keygroup
  def value
    TOML::Keygroup.new(nested_keys.to_s.split("."))
  end
end
