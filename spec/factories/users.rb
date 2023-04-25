FactoryBot.define do
  factory :user do
    peason = Gimei.name

    nickname { peason.kanji }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    occupation { Faker::Lorem.words(number: 1) }
    position { Faker::Lorem.words(number: 1) }
  end
end
