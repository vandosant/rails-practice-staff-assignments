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

  scenario 'Users can edit people' do
    person = Person.create!(first_name: "Rob", last_name: "Ford")
    user = create_user
    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Login"

    visit person_path(person.id)
    expect(page).to have_content "Rob Ford"
    click_link "Edit"

    expect(page).to have_content "Title"
    expect(page).to have_content "First name"
    page.has_field?('First name', :with => 'Rob')
    expect(page).to have_content "Last name"
    page.has_field?('Last name', :with => 'Ford')
    fill_in "Last name", :with => "Fordy"

    click_button "Update"
    expect(page).to have_content "Fordy"
  end
end