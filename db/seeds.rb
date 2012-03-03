5000.times do
  s = Student.create!(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      email: Faker::Internet.email,
                      phone: Faker::PhoneNumber.phone_number
                     )

  s.address = Address.create!(street: Faker::Address.street_name,
                              city: Faker::Address.city,
                              state: Faker::Address.state,
                              zip: Faker::Address.zip
                             )
end


