require 'spec_helper'
require_relative 'support/shared_contexts/test_collections'
require_relative 'support/shared_contexts/test_procs'
require_relative 'support/shared_examples/param_receiver'
require_relative 'support/shared_examples/block_receiver'

describe Firuta do
  include_context 'test collections'
  include_context 'test procs'

  describe 'version' do
    it 'is the correct version' do
      expect(described_class::VERSION).to eq('0.1.0')
    end
  end

  let(:firuta) { described_class.new }
  let(:param) { 'simple param' }
  let(:block) { empty_proc }

  describe '#filter' do
    let(:command_class) { Firuta::Commands::Filter }
    let(:method) { :filter }

    it_behaves_like 'param receiver'
    it_behaves_like 'block receiver'
  end

  describe '#map' do
    let(:command_class) { Firuta::Commands::Map }
    let(:method) { :map }

    it_behaves_like 'param receiver'
    it_behaves_like 'block receiver'
  end

  describe '#sort' do
    let(:command_class) { Firuta::Commands::Sort }
    let(:method) { :sort }

    it_behaves_like 'param receiver'
    it_behaves_like 'block receiver'
  end

  describe '#reduce' do
    let(:command_class) { Firuta::Commands::Reduce }
    let(:method) { :reduce }

    it_behaves_like 'param receiver'
    it_behaves_like 'block receiver'
  end

  describe '#paginate' do
    let(:command_class) { Firuta::Commands::Paginate }
    let(:method) { :paginate }

    it_behaves_like 'param receiver'
    it_behaves_like 'block receiver'
  end

  describe '#uniq' do
    let(:command_class) { Firuta::Commands::Uniq }
    let(:method) { :uniq }

    it_behaves_like 'param receiver'
    it_behaves_like 'block receiver'
  end

  describe '#find' do
    let(:command_class) { Firuta::Commands::Find }
    let(:method) { :find }

    it_behaves_like 'param receiver'
    it_behaves_like 'block receiver'
  end

  # rubocop:disable Performance/CompareWithBlock
  describe '#apply' do
    context 'with collection' do
      it 'applies the commands correctly' do
        applied =
          described_class.new(book_collection)
                         .filter(price_more_than, with: [70])
                         .filter(function: price_more_than, with: [80])
                         .sort { |x, y| x.name <=> y.name }
                         .map(->(elem, price) { elem.change_price(price) }, with: 50)
                         .map(function: ->(elem, price) { elem.change_price(price) }, with: 51)
                         .map { |elem| elem.change_price(100) }
                         .uniq(&:name)
                         .paginate(with: { page: 1, page_size: 5 })
                         .apply
        expect(applied.size).to eq(5)
      end
    end

    context 'when passing collection at the end' do
      it 'applies the commands correctly' do
        applied =
          described_class.new
                         .filter(price_more_than, with: [70])
                         .filter(function: price_more_than, with: [80])
                         .sort { |x, y| x.name <=> y.name }
                         .map(->(elem, price) { elem.change_price(price) }, with: 50)
                         .map(function: ->(elem, price) { elem.change_price(price) }, with: 51)
                         .map { |elem| elem.change_price(100) }
                         .uniq(&:name)
                         .paginate(with: { page: 1, page_size: 5 })
                         .apply(book_collection)
        expect(applied.size).to eq(5)
      end
    end
  end
  # rubocop:enable Performance/CompareWithBlock
end
