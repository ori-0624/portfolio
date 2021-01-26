FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test|#{n}@test.com" }
    name { "test"}
    password { "password" }
  end
end