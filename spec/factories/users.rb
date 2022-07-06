FactoryBot.define do
  factory :user, class: "User" do
    email { Faker::Internet.email }
    password { "password" }
    confirmed_at { Time.now.utc }

    trait :as_admin do
      after(:create) do |user|
        user.add_role(:admin)
      end
    end
  end
end
