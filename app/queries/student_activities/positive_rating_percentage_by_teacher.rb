# frozen_string_literal: true

module StudentActivities
  class PositiveRatingPercentageByTeacher < ::ApplicationQuery
    attr_reader :teacher

    def initialize(teacher:)
      @teacher = teacher
    end

    def call
      rated_positively = teacher
        .student_activities
        .where(rated_positively: true)
        .count
        .to_f

      student_activities_count = teacher
        .student_activities
        .count
        .to_f

      return nil if student_activities_count.zero?

      rated_positively * 100 / student_activities_count
    end
  end
end
