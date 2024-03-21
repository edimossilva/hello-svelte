# frozen_string_literal: true

module StudentStandards
  class AverageGrowthByTeacher < ::ApplicationQuery
    attr_reader :teacher

    def initialize(teacher:)
      @teacher = teacher
    end

    def call
      teacher
        .student_standards
        .average(:quiz_growth)
    end
  end
end
