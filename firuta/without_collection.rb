require_relative 'base'

module Firuta
  class WithoutCollection < Base
    def apply_all_to(collection = [])
      apply_with(collection, :&)
    end

    def apply_any_to(collection = [])
      apply_with(collection, :|)
    end
  end
end
