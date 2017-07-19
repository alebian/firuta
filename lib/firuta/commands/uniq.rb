require_relative 'base'

module Firuta
  module Commands
    class Uniq < Base
      def apply_to(collection)
        collection.uniq(&@proc)
      end
    end
  end
end
