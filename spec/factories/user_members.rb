FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test|#{n}@test.com" }
    name { "test" }
    password { "password" }
    
    trait :other_user do
      name { "test2" }
    end
  end
end