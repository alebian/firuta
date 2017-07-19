require_relative 'base'

module Firuta
  module Commands
    class Reduce < Base
      def call(element)
        @proc.call(*@params, element)
      end

      def apply_to(collection)
        collection.reduce(*@params, &@proc)
      end

      def self.terminal?
        true
      end
    end
  end
end
