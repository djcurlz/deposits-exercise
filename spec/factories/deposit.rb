FactoryBot.define do
  factory :deposit do
    association :tradeline
    date { Date.today + 1.day }
    amount { 100.0 }
  end
end
