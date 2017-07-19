require_relative 'firuta'
require_relative 'test_model'
require_relative 'filters'

elements = [
  TestModel.new(10, 'a'),
  TestModel.new(3, 'bb'),
  TestModel.new(-1, 'cc')
]

conjunction_result =
  Firuta
    .do(filter: BY_PRICE, with: [1, 9])
    .do(filter: BY_LENGTH, with: [1])
    .apply_all_to(elements)

disjunction_result =
  Firuta
    .do(filter: STARTS_WITH_A)
    .do(filter: BY_LENGTH, with: [1])
    .apply_any_to(elements)

puts conjunction_result
puts '-------------------------'
puts disjunction_result
