class Book
  attr_reader :price, :name

  def initialize(attributes = {})
    @price = attributes[:price]
    @name = attributes[:name]
    @author = attributes[:author]
  end

  def change_price(new_price)
    Book.new(price: new_price, name: @name, auhor: @author)
  end
end
