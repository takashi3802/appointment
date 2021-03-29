FactoryBot.define do
  factory :user do
    name                  {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {'000aaa'}
    password_confirmation {password}
    gender_id             {2}
    age                   {33}
    phone                 {'00000000000'}
  end
end