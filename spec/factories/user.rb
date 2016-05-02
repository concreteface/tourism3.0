FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@test.com" }
    sequence(:username) { |n| "santa#{n}" }
    password "password"
    before(:create){|user| user.add_avatar('test.jpg')}
  end
end
