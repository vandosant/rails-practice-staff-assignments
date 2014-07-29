require 'rails_helper'

describe Person do
  it 'is valid with a title and last name' do
    person = Person.new(title: "Mr.", last_name: "Ford")
    expect(person.valid?).to eq true
  end

  it 'is valid with a first name and last name' do
    person = Person.new(first_name: "Rob", last_name: "Ford")
    expect(person.valid?).to eq true
  end

  it 'is invalid with only a title and first name' do
    person = Person.new(title: "Mr.", first_name: "Rob")
    expect(person.valid?).to eq false
    expect(person).to have(1).errors_on :last_name
  end

  it 'is invalid with only a title' do
    person = Person.new(title: "Mr.")
    expect(person.valid?).to eq false
    expect(person).to have(1).errors_on :last_name
  end

  it 'is invalid with only a last name' do
    person = Person.new(last_name: "Ford")
    expect(person.valid?).to eq false
    expect(person).to have(1).errors_on :first_name
  end
end