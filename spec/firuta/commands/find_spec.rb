require 'spec_helper'
require_relative '../../support/shared_contexts/test_collections'
require_relative '../../support/shared_contexts/test_procs'

describe Firuta::Commands::Find do
  include_context 'test collections'
  include_context 'test procs'

  subject(:command) { described_class.new(function) }

  let(:function) { is_the_hobbit }
  let(:book_name) { 'The Hobbit' }

  describe '#call' do
    it 'executes the proc correctly' do
      expect(
        command.call(Book.new(name: book_name))
      ).to be_truthy
    end
  end

  describe '#apply_to' do
    it 'executes the proc for every elment of the collection' do
      applied = command.apply_to(book_collection)
      expect(applied.name).to eq(book_name)
    end
  end

  describe '.terminal?' do
    it 'is not terminal' do
      expect(described_class.terminal?).to be_truthy
    end
  end
end
