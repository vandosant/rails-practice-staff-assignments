require 'rails_helper'

describe Assignment do
  it 'is valid if location is the same but role is unique' do
    location = Location.create!(name: "Denver")
    Assignment.create!(location_id: location.id, role: "Manager")
    assignment = Assignment.new(location_id: location.id, role: "Subordinate")
    expect(assignment.valid?).to eq true
  end

  it 'is invalid if location and role are not unique' do
    location = Location.create!(name: "Denver")
    Assignment.create!(location_id: location.id, role: "Manager")
    assignment = Assignment.new(location_id: location.id, role: "Manager")
    expect(assignment.valid?).to eq false
    expect(assignment).to have(1).error_on :role
  end
end