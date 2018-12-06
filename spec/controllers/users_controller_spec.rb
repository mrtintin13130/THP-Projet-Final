require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  context 'GET #show' do
    before do
      
    end
    end
    it 'returns a success response' do
      user = User.find(id: 1)
      get :show, params: { id: user.to_param }
      expect(response).to be_successful
    end
  end
end
