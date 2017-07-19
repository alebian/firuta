module Firuta
  module Commands
    class Base
      def initialize(proc, params)
        @proc = proc
        @params = params
      end

      def call(element)
        @proc.call(element, *@params)
      end

      def terminal?
        false
      end
    end
  end
end
