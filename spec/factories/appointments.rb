FactoryGirl.define do
  factory :appointment do
    initial_time Date.today()
    final_time Date.tomorrow()
    description "test"
    association :service, factory: :service
    association :user, factory: :user
  end
end
