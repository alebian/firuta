require_relative 'base'

module Firuta
  module Commands
    class Map < Base
      def apply_to(collection)
        collection.map { |element| call(element) }
      end
    end
  end
end
