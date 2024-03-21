# frozen_string_literal: true

class StudentStandard < ApplicationRecord
  belongs_to :student
  has_many :student_activities, dependent: :destroy

  scope :completed_by_teacher, StudentStandards::CompletedByTeacher
  scope :average_growth_by_teacher, StudentStandards::AverageGrowthByTeacher
end
