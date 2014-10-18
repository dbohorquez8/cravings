FactoryGirl.define do
  factory :choice do
    name Faker::Lorem.word

    factory :choice_with_tags do
      transient do
        tags_count 1
      end

      after(:create) do |choice, evaluator|
        FactoryGirl.create_list(:tagging, evaluator.tags_count, choice: choice)
      end
    end
  end
end
