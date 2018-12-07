require 'rails_helper'

feature "signing in" do
  let(:user) {FactoryBot.build(:user)}

  def fill_in_fields
    stripe_card_number = Stripe.setPublishableKey()

    fill_in "email", with: user.email
    find_field('Card number').send_keys(stripe_card_number)
    find_field('MM / YY').send_keys "01#{DateTime.now.year + 1}"
    find_field('CVC').send_keys '123'
    #find(:css, ".Checkb").set(true)
    #find_field('').send_keys ''

    find('button[type="submit"]').click
  end

  scenario "visiting the site to sign in" do
    visit new_charge_path
    click_button "stripe-button"
    fill_in_fields
    expect(charges_path).to have_content("Thanks, you paid")
  end
end
