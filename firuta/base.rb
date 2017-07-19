require_relative 'commands/filter'

module Firuta
  class Base
    attr_reader :filters

    def initialize(_collection = nil)
      @filters = []
    end

    def filter(filter, with: [])
      filters << Commands::Filter.new(filter, with)
      self
    end

    def apply_with(collection, reducer)
      collection.select do |element|
        filters
          .map { |filter| filter.call(element) }
          .reduce(reducer)
      end
    end
  end
end
