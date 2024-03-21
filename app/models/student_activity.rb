# frozen_string_literal: true

class StudentActivity < ApplicationRecord
  belongs_to :student_standard
  scope :positive_rating_percentage_by_teacher, StudentActivities::PositiveRatingPercentageByTeacher
end
