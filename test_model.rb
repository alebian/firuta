class TestModel
  def initialize(price, name)
    @price = price
    @name = name
  end

  def price
    @price
  end

  def name
    @name
  end

  def to_s
    "#{name} -> #{price}"
  end
end
