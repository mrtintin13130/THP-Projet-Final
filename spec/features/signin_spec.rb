require 'rails_helper'

feature "signing in" do
  let(:user) {FactoryBot.build(:user)}

  def fill_in_signin_field
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    fill_in "user[password_confirmation]", with: user.password
    click_button("Sign up")
  end

  scenario "visiting the site to sign in" do
    visit root_path
    click_link "S'enregistrer"
    fill_in_signin_field
    expect(page).to have_content("Signed in successfuly")
  end
end
