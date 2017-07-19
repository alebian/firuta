require_relative '../errors/subclass_must_implement'

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

      def apply_to(*params)
        raise SubclassMustImplement
      end

      def self.terminal?
        false
      end
    end
  end
end
