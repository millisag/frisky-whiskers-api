FactoryBot.define do
  factory :cat do
    name { Faker::Creature::Cat.name }
    age { rand(1..15) }
    weight { rand(5..20) }
    breed { Faker::Creature::Cat.breed }
    color { Faker::Color.color_name }
    user
  end
end
