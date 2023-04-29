FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    sentence { Faker::Lorem.sentence }
    association :user
    association :group
  end
end
