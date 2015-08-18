Fabricator(:user) do
  email { Faker::Internet.email}
  username { Faker::Name.name}
  password 'password'
  admin false
end
