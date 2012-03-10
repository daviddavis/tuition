STUDENT_RECORDS = 800

people = ["Philip Glass", "Friedrich Nietzsche", "H. L. Mencken", "Stephen Hawking", "Gandhi", "Francisco Goya",
  "Paul Gauguin", "Jan Pieterszoon Sweelinck", "Willem de Kooning", "Haskell Curry", "Albert Einstein", "Soren Kierkegaard",
  "Jean-Paul Sartre", "Andrew Wiles"]
adjectives = ["Post-Modern", "Neo-Classical", "Subatomic", "Nietzschean", "Everyday", "Keynesian", "Modern", "Socialist", "Newtonian"]
topics = ["Complexity Theory", "Metaphysics", "Liberalism", "Futurism", "Ethics", "Astrophysics", "Enconomics", "Epistemology", 
  "Existentialism", "Nihilism", "Consequentialism", "Modularity Theory"]

(STUDENT_RECORDS / 8).times do
  Course.create!(name: "#{people.sample} and #{adjectives.sample} #{topics.sample}", credits: rand(1..5), active: (rand(11) == 1))
end

STUDENT_RECORDS.times do
  s = Student.create!(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      email: Faker::Internet.email,
                      phone: Faker::PhoneNumber.phone_number
                     )

  s.address = Address.create!(street: Faker::Address.street_address(rand(4) == 1),
                              city: Faker::Address.city,
                              state: Faker::Address.state,
                              zip: Faker::Address.zip
                             )

  s.courses = Course.all.sample(rand(5))

  payments = rand(5)
  payments.to_i.times do |i|
    s.payments.create!(amount: s.balance_due / payments * (rand + 0.1), paid_at: rand(100).days.ago)
  end
end
