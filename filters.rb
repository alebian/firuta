BY_PRICE = Proc.new { |element, min_price, max_price| element.price > min_price && element.price < max_price }
BY_LENGTH = Proc.new { |element, size| element.name.length > size }
STARTS_WITH_A = Proc.new { |element| element.name[0] == 'a' }
