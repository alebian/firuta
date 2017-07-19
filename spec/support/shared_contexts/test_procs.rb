shared_context 'test procs' do
  let(:price_more_than) { ->(element, price) { element.price > price } }
  let(:is_the_hobbit)   { ->(element) { element.name == 'The Hobbit' } }
  let(:change_prices)   { ->(element, price) { element.change_price(price) } }
  let(:sum_prices)      { ->(acc, element) { acc + element.price } }
  let(:empty_proc)      { ->(_) {} }
end
