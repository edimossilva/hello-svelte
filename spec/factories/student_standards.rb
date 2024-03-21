# frozen_string_literal: true

FactoryBot.define do
  factory :student_standard do
    student
    sequence(:subject_area) { |n| n }
  end
end
