FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {"aaa123@gmail.com"}
    password              {"aaa123"}
    password_confirmation {password}
    parent_id             {"1"}
  end
end