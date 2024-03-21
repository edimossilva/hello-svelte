# frozen_string_literal: true

FactoryBot.define do
  factory :student do
    teacher
    sequence(:username) { |n| "username#{n}" }
  end
end
