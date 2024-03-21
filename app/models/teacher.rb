# frozen_string_literal: true

class Teacher < ApplicationRecord
  belongs_to :user
  has_many :students, dependent: :nullify
  has_many :student_standards, through: :students
end
