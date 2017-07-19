require 'spec_helper'
require_relative '../../support/shared_contexts/test_collections'
require_relative '../../support/shared_contexts/test_procs'

describe Firuta::Commands::Reduce do
  include_context 'test collections'
  include_context 'test procs'

  subject(:command) { described_class.new(function, params) }

  let(:function) { sum_prices }
  let(:params) { 0 }

  describe '#call' do
    it 'executes the proc correctly' do
      expect(command.call(book_collection.first)).to eq(book_collection.first.price)
    end
  end

  describe '#apply_to' do
    it 'executes the proc for every elment of the collection' do
      applied = command.apply_to(book_collection)
      expect(applied.round(2)).to be_within(0.01).of(1947.4)
    end
  end

  describe '.terminal?' do
    it 'is not terminal' do
      expect(described_class.terminal?).to be_truthy
    end
  end
end
