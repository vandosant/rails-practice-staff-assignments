User.destroy_all
Person.destroy_all

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