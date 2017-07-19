require_relative 'firuta'
require_relative 'test_model'
require_relative 'filters'

elements = [
  TestModel.new(10, 'aa'),
  TestModel.new(3, 'bb'),
  TestModel.new(-1, 'cccc'),
  TestModel.new(-5, 'ccdddd'),
  TestModel.new(8, 'asd'),
  TestModel.new(8, 'asd'),
  TestModel.new(100, 'asdasd'),
  TestModel.new(56, 'asdasdasd'),
  TestModel.new(-150, 'asdasdasdasdasd')
]

puts Firuta.new
       .filter(BY_PRICE, with: [-10, 20])
       .filter(BY_LENGTH, with: [1])
       .map { |elem| elem.set_name 'a' }
       .sort { |x, y| x.price <=> y.price }
       .uniq { |a| a.price }
       .paginate(with: { page: 1, page_size: 2 })
       .apply(elements)

puts '-------------------------'

puts Firuta.new(elements)
       .filter(BY_PRICE, with: [-10, 20])
       .filter(BY_LENGTH, with: [1])
       .map { |elem| elem.set_name 'a' }
       .sort { |x, y| x.price <=> y.price }
       .uniq { |a| a.price }
       .apply
