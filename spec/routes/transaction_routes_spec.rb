require 'rails_helper'

RSpec.describe TransactionsController, type: :routing do
  describe 'transaction routing' do
    it 'transactions index route' do
      expect(get: 'categories/1/transactions').to route_to('transactions#index', category_id: '1')
    end

    it 'new transactions routes' do
      expect(get: 'categories/1/transactions/new').to route_to('transactions#new', category_id: '1')
    end

    it 'create transactions route' do
      expect(post: 'categories/1/transactions').to route_to('transactions#create', category_id: '1')
    end
  end
end
