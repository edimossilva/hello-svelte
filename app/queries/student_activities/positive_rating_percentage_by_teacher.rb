# frozen_string_literal: true

module StudentActivities
  class PositiveRatingPercentageByTeacher < ::ApplicationQuery
    attr_reader :teacher, :scope

    def initialize(teacher:, scope: StudentActivity)
      @teacher = teacher
      @scope = scope
    end

    def call
      rated_positively = scope
        .by_teacher(teacher:)
        .where(rated_positively: true)
        .count
        .to_f

      student_activities_count = scope
        .by_teacher(teacher:)
        .count
        .to_f

      return nil if student_activities_count.zero?

      rated_positively * 100 / student_activities_count
    end
  end
end
