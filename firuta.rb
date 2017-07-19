class Firuta
  attr_reader :filters

  def initialize
    @filters = []
  end

  def self.do(*params)
    new.do(*params)
  end

  def do(filter:, with: [])
    filters << Filter.new(filter, with)
    self
  end

  def apply_all_to(collection = [])
    apply_with(collection, :&)
  end

  def apply_any_to(collection = [])
    apply_with(collection, :|)
  end

  private

  class Filter
    def initialize(proc, params)
      @proc = proc
      @params = params
    end

    def call(element)
      @proc.call(element, *@params)
    end
  end

  def apply_with(collection, reducer)
    collection.select do |element|
      filters
        .map { |filter| filter.call(element) }
        .reduce(reducer)
    end
  end
end
