# frozen_string_literal: true

FactoryBot.define do
  factory :tradeline do
    name { 'Some Credit Card' }
    amount { 3223.54 }
  end
end