require 'rails_helper'
require 'capybara/rails'

feature 'managing people' do
  scenario 'Users can see a person show page' do
    person = Person.create!(first_name: "Rob", last_name: "Ford")
    user = create_user
    log_user_in(user)

    visit '/'
    click_link "Rob Ford"

    expect(page).to have_content "Rob Ford"
    expect(page.current_path).to eq person_path(person.id)
  end

  scenario 'Users can edit people' do
    person = Person.create!(first_name: "Rob", last_name: "Ford")
    user = create_user
    log_user_in(user)

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

  scenario 'Users must enter a title or first name and a last name' do
    person = Person.create!(first_name: "Rob", last_name: "Ford")
    user = create_user
    log_user_in(user)

    visit person_path(person.id)
    expect(page).to have_content "Rob Ford"
    click_link "Edit"

    expect(page).to have_content "Title"
    expect(page).to have_content "First name"
    expect(page).to have_content "Last name"
    fill_in "First name", :with => ""
    fill_in "Last name", :with => ""
    click_button "Update"
    expect(page).to have_content "Last name is required"

    expect(page).to have_content "Title"
    expect(page).to have_content "First name"
    expect(page).to have_content "Last name"
    fill_in "First name", :with => ""
    fill_in "Last name", :with => "Ford"
    fill_in "Title", :with => ""
    click_button "Update"
    expect(page).to have_content "Title is required"
  end

  scenario 'Users can assign users to locations' do
    person = Person.create!(first_name: "Rob", last_name: "Ford")
    location = Location.create!(name: "Denver")
    user = create_user
    log_user_in(user)

    visit person_path(person.id)
    click_link "+ Add Location"
    page.select location.name, :from => "Location"
    fill_in "Role", :with => "Manager"
    click_button "Assign"

    expect(page).to have_content "Rob Ford"
    expect(page).to have_content "Locations"
    expect(page).to have_content location.name
    expect(page).to have_content "Role"
    expect(page).to have_content "Manager"
  end

  def log_user_in(user)
    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Login"
  end
end