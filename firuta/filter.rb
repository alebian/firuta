module Firuta
  class Filter
    def initialize(proc, params)
      @proc = proc
      @params = params
    end

    def call(element)
      @proc.call(element, *@params)
    end
  end
end
