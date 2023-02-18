require './spec/rails_helper'

describe 'Routes for transacts', type: :routing do
  it 'routes get /categories/1/transacts to the transacts controller' do
    expect(get(category_transacts_path('1'))).to route_to('transacts#index', category_id: '1')
  end

  it 'routes get /categories/1/transacts/new to the transacts controller' do
    expect(get(new_category_transact_path(1))).to route_to('transacts#new', category_id: '1')
  end

  it 'routes post /categories/1/transacts to the transacts controller' do
    expect(post(category_transacts_path(1))).to route_to('transacts#create', category_id: '1')
  end
end
