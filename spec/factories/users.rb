FactoryGirl.define do
  factory :user do
    login { Faker::Internet.user_name }
    password { Faker::Internet.password }
    password_confirmation { password }
    role { :user }
    token { Faker::Internet.password(24) }
    main { build(:main) }

    trait :with_position do
      main { build(:main, position: 1) }
    end
  end
end
