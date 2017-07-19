require_relative 'base'

module Firuta
  module Commands
    class Filter < Base
      def apply_to(collection)
        collection.select { |element| call(element) }
      end
    end
  end
end
