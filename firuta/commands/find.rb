require_relative 'base'

module Firuta
  module Commands
    class Find < Base
      def apply_to(collection)
        collection.find &@proc
      end

      def self.terminal?
        true
      end
    end
  end
end
