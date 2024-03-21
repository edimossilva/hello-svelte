# frozen_string_literal: true

class Student < ApplicationRecord
  belongs_to :teacher
  has_many :student_standards, dependent: :destroy
end
