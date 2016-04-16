FactoryGirl.define do
  factory :visit do
    association :user, factory: :user
    association :attraction, factory: :attraction
  end
end
