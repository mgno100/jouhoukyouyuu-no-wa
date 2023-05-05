FactoryBot.define do
  factory :group do
    name { Faker::Team.name }
    introduction { Faker::Lorem.sentence }
    association :user
  end
end
