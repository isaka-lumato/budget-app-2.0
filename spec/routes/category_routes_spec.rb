require 'rails_helper'

RSpec.describe CategoriesController, type: :routing do
  describe 'category routing' do
    it 'categories index route' do
      expect(get: '/categories').to route_to('categories#index')
    end

    it 'new categories routes' do
      expect(get: '/categories/new').to route_to('categories#new')
    end

    it 'create categories routes' do
      expect(post: '/categories').to route_to('categories#create')
    end
  end
end
