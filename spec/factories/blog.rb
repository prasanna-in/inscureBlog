FactoryGirl.define do
  factory :blog do
    title { Faker::Lorem.characters(10) }
    body { Faker::Lorem.characters(100) }
    username { Faker::Name.name }

    ignore do
      # transient fields
    end

    trait :links do
      links 'Dummy link examples'
    end
  end
end