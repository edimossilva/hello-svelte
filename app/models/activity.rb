# frozen_string_literal: true

class Activity < ApplicationRecord
  has_many :student_activities, dependent: :destroy
end
