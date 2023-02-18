require './spec/rails_helper'

describe 'Routes for categories', type: :routing do
  it 'routes root path / to the categories controller' do
    expect(get(categories_path)).to route_to('categories#index')
  end

  it 'routes get /categories/new to the categories controller' do
    expect(get(new_category_path)).to route_to('categories#new')
  end

  it 'routes post /categories to the categories controller' do
    expect(post(categories_path)).to route_to('categories#create')
  end
end
