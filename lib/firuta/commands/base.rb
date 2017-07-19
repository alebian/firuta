require_relative '../errors/subclass_must_implement'

module Firuta
  module Commands
    class Base
      def initialize(function, params = nil)
        @proc = function
        @params = [params].flatten.compact
      end

      def call(element)
        return @proc.call(element) if @params.empty?
        @proc.call(element, *@params)
      end

      def apply_to(*_params)
        raise Errors::SubclassMustImplement
      end

      def self.terminal?
        false
      end
    end
  end
end
