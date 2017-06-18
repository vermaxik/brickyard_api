FactoryGirl.define do
  factory :main do
    state { Faker::Name.name }
    position { Faker::Number.number(4) }
  end
end
