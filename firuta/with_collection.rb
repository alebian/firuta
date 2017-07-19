require_relative 'base'

module Firuta
  class WithCollection < Base
    def initialize(collection)
      @collection = collection
      super
    end

    def apply_all
      apply_with(@collection, :&)
    end

    def apply_any
      apply_with(@collection, :|)
    end
  end
end
