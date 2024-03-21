# frozen_string_literal: true

class StudentActivity < ApplicationRecord
  belongs_to :student_standard
  belongs_to :activity

  scope :positive_rating_percentage_by_teacher, StudentActivities::PositiveRatingPercentageByTeacher
  scope :by_activity, ->(activity:) { where(activity:) }
  scope :by_teacher, lambda { |teacher:|
    where(student_standard_id: teacher.student_standards.pluck(:id))
  }
end
