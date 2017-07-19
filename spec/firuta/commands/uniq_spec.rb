require 'spec_helper'
require_relative '../../support/shared_contexts/test_collections'
require_relative '../../support/shared_contexts/test_procs'

describe Firuta::Commands::Uniq do
  include_context 'test collections'
  include_context 'test procs'

  subject(:command) { described_class.new(function) }

  let(:function) { ->(book) { book.price } }

  describe '#call' do
    it 'executes the proc correctly' do
      expect(command.call(book_collection.first)).to eq(book_collection.first.price)
    end
  end

  describe '#apply_to' do
    it 'executes the proc for every elment of the collection' do
      applied = command.apply_to(book_collection)
      expect(applied.size).to eq(book_collection.size - 1)
    end
  end

  describe '.terminal?' do
    it 'is not terminal' do
      expect(described_class.terminal?).to be_falsey
    end
  end
end
