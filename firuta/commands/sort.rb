require_relative 'base'

module Firuta
  module Commands
    class Sort < Base
      def apply_to(collection)
        collection.sort &@proc
      end
    end
  end
end
