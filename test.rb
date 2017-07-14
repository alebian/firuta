require_relative 'filter_applier'
require_relative 'test_model'
require_relative 'filters'

elements = [
  TestModel.new(10, 'a'),
  TestModel.new(3, 'bb'),
  TestModel.new(-1, 'cc')
]

conjunction_result =
  FilterApplier
    .add(filter: BY_PRICE, params: [1, 9])
    .add(filter: BY_LENGTH, params: [1])
    .filter(elements)

disjunction_result =
  FilterApplier.new(:disjunction)
    .add(filter: STARTS_WITH_A)
    .add(filter: BY_LENGTH, params: [1])
    .filter(elements)

puts 'Conjunction results:'
puts conjunction_result
puts 'Disjunction results:'
puts disjunction_result
