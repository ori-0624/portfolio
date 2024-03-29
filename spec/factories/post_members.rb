FactoryBot.define do
  factory :post do
    user_id { create(:user).id }
    sequence(:content) { |n| "testContent-|#{n}" }
    created_at { DateTime.yesterday }
    
    trait :newest_post do
      created_at {DateTime.now }
    end
    
    trait :user_id_is_nil do
      user_id { nil }
    end
    
    trait :content_is_nil do
      content { nil }
    end
    
    trait :content_is_eq_to_maxlength do
      content { "a" * 300 }
    end
    
    trait :content_is_over_maxlength do
      content { "a" * 301 }
    end
    
    trait :others_post do
      user_id { create(:user, :other_user).id }
    end
  end
end