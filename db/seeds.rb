User.destroy_all
Person.destroy_all
Location.destroy_all

User.create!(
  name: "Some User",
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password'
)

Person.create!(
  title: "Mr",
  first_name: "Joe",
  last_name: "Example",
)

["Northeast", "Midwest", "Mountain West", "Northwest", "Southwest", "Deep south", "Texas"].each do |name|
  Location.create!(name: name)
end