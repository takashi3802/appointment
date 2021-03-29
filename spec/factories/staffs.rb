FactoryBot.define do
  factory :staff do
    name         {Faker::Name.name}
    advantage    {Faker::Lorem.sentence}
    position     {Faker::Lorem.sentence}
    appeal       {Faker::Lorem.sentence}
    gender_id             {2}
    age          {33}

    after(:build) do |staff|
      staff.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
