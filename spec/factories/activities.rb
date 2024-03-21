# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    sequence(:name) { |n| "activity_name#{n}" }
    sequence(:description) { |n| "description#{n}" }
  end
end
