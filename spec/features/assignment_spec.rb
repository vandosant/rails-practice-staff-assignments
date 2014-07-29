require 'rails_helper'

feature 'managing assignments' do
  scenario 'Users can edit assignments' do
    person = Person.create!(first_name: "Rob", last_name: "Ford")
    location = Location.create!(name: "Denver")
    Assignment.create!(person_id: person.id, location_id: location.id, role: "Manager")
    user = create_user
    log_user_in(user)

    visit person_path(person.id)
    within ".assignment" do
      click_link "edit"
    end

    fill_in "Role", :with => "Subordinate"
    click_button "Assign"

    expect(page).to have_content "Rob Ford"
    expect(page).to have_content "Role"
    expect(page).to have_content "Subordinate"
    expect(page).to_not have_content "Manager"
  end

  scenario 'Users can delete assignments' do
    person = Person.create!(first_name: "Rob", last_name: "Ford")
    location = Location.create!(name: "Denver")
    Assignment.create!(person_id: person.id, location_id: location.id, role: "Manager")
    user = create_user
    log_user_in(user)

    visit person_path(person.id)
    within ".assignment" do
      click_link "delete"
    end

    expect(page).to have_content person.first_name
    expect(page).to_not have_content "Denver"
    expect(page).to_not have_content "Manager"
  end

  scenario 'Users can see the number of assignments' do
    person = Person.create!(first_name: "Rob", last_name: "Ford")
    location = Location.create!(name: "Denver")
    Assignment.create!(person_id: person.id, location_id: location.id, role: "Manager")
    user = create_user
    log_user_in(user)

    visit root_path

    within "table.table" do
      expect(page).to have_content "Location"
      within "tr.person" do
        expect(page).to have_content person.first_name
        expect(page).to have_content "1"
      end
    end
  end

  def log_user_in(user)
    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Login"
  end
end