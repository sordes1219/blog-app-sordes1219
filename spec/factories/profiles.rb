FactoryBot.define do
  factory :profile do
    nickname { Faker::Name.name }
    gender { Profile.genders.keys.sample }
    introduction { Faker::Lorem.characters(number: 100) }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end