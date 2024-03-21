# frozen_string_literal: true

module StudentStandards
  class CompletedByTeacher < ::ApplicationQuery
    attr_reader :teacher, :start_date, :end_date

    def initialize(teacher:, start_date:, end_date:)
      @teacher = teacher
      @start_date = start_date
      @end_date = end_date
    end

    def call
      teacher.student_standards
        .where("began_on >= ? AND ended_on <= ?", start_date, end_date)
        .where.not(final_quiz_score: nil)
        .count
    end
  end
end
