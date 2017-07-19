class TestModel
  attr_reader :price, :name

  def initialize(price, name)
    @price = price
    @name = name
  end

  def set_name(new_name)
    TestModel.new(@price, new_name)
  end

  def set_price(new_price)
    TestModel.new(new_price, @name)
  end

  def to_s
    "#{@name} -> #{@price}"
  end
end
