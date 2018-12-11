require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) {FactoryBot.build(:user)}

  context 'GET users#index' do
    it 'returns success for index' do
      get :index
      assert_response :success
    end
  end


  it 'GET user#show/:id' do
    user = create(:user)
    get :show, params: {id: user.to_param }
    assert_response :success
  end

  scenario "user can connect and pay", :js => true do
    get new_user_session_path
    click_link "Se connecter"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'

end
end
