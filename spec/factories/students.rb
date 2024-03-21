# frozen_string_literal: true

FactoryBot.define do
  factory :student do
    teacher
    sequence(:username) { |n| "username#{n}" }
    sequence(:first_name) { |n| "usernamfirst_namee#{n}" }
    sequence(:last_name) { |n| "last_name#{n}" }
  end
end
