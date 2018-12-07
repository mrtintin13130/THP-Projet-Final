require 'rails_helper'

feature "Get Premium" do
  let(:user) {FactoryBot.build(:user)}

  scenario "user can connect and pay", :js => true do
    visit new_user_session_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'

    visit new_charge_path
    click_button "Pay with Card"

    Capybara.within_frame 'stripe_checkout_app' do
      fill_in 'Email', :with => 'persona@example.com'
      fill_in "Card number", :with => "4242424242424242"
      fill_in 'CVC', :with => '123'
      fill_in 'MM / YY', :with => '11/20'
      click_button 'Pay'
    end

    Capybara.default_max_wait_time = 10
    expect(user).to have_attributes(:premium_user => true)
    #.to have_content("Thanks, you paid ")
  end
end
