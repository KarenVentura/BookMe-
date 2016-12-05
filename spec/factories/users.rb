FactoryGirl.define do
  factory :user do
    name "Karen"
    last_name "Ventura"
    email { FFaker::Internet.email }
    telephone "1231231231"
    cellphone "1231231234"
    password "12345678"
    password_confirmation "12345678"
  end
end
