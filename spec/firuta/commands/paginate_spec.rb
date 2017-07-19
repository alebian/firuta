require 'spec_helper'
require_relative '../../support/shared_contexts/test_collections'
require_relative '../../support/shared_contexts/test_procs'

describe Firuta::Commands::Paginate do
  include_context 'test collections'
  include_context 'test procs'

  subject(:command) { described_class.new(nil, params) }

  let(:params) { { page: 2, page_size: 2 } }

  describe '#apply_to' do
    it 'executes the proc for every elment of the collection' do
      applied = command.apply_to(book_collection)
      expect(applied.size).to eq(2)
    end
  end

  describe '.terminal?' do
    it 'is not terminal' do
      expect(described_class.terminal?).to be_falsey
    end
  end
end
