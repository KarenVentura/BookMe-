FactoryGirl.define do
  factory :service do
    name "Gynecology Gomez"
    description "test"
    week_days "Monday, Friday"
    specialty "health"
    association :category, factory: :category
    association :user, factory: :user
  end
end
