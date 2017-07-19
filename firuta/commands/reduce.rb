require_relative 'base'

module Firuta
  module Commands
    class Reduce < Base
      def apply_to(collection)
        collection.reduce(*@params, &@proc)
      end

      def self.terminal?
        true
      end
    end
  end
end
