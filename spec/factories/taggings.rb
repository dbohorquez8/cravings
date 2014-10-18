FactoryGirl.define do
  factory :tagging do
    association :tag
    association :choice
  end
end
