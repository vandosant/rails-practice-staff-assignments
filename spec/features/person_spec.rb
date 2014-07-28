require 'rails_helper'
require 'capybara/rails'

feature 'managing people' do
  scenario 'Users can see a person show page' do
    person = Person.create!(first_name: "Rob", last_name: "Ford")
    user = create_user
    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Login"

    visit '/'
    click_link "Rob Ford"

    expect(page).to have_content "Rob Ford"
    expect(page.current_path).to eq person_path(person.id)
  end
end