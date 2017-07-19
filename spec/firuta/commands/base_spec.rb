require 'spec_helper'
require_relative '../../support/shared_contexts/test_collections'
require_relative '../../support/shared_contexts/test_procs'

describe Firuta::Commands::Base do
  include_context 'test collections'
  include_context 'test procs'

  subject(:command) { described_class.new(function, params) }

  let(:function) { ->(element, other) { element.price + other } }
  let(:params) { 30 }

  describe '#call' do
    it 'executes the proc correctly' do
      expect(command.call(book_collection.first)).to eq(book_collection.first.price + params)
    end
  end

  describe '#apply_to' do
    it 'executes the proc for every elment of the collection' do
      expect { command.apply_to(book_collection) }
        .to raise_error Firuta::Errors::SubclassMustImplement
    end
  end

  describe '.terminal?' do
    it 'is not terminal' do
      expect(described_class.terminal?).to be_falsey
    end
  end
end
