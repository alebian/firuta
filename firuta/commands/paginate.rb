require_relative 'base'

module Firuta
  module Commands
    class Paginate < Base
      DEFAULT_PER_PAGE = 10
      DEFAULT_PAGE = 0

      def apply_to(collection)
        collection
          .each_slice(@params[:page_size] || DEFAULT_PER_PAGE)
          .to_a[@params[:page] || DEFAULT_PAGE]
      end

      def self.terminal?
        true
      end
    end
  end
end
