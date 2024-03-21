# frozen_string_literal: true

require "rails_helper"

RSpec.describe StudentStandards::AverageGrowthByTeacher do
  describe "#StudentStandard.average_growth_by_teacher" do
    subject { StudentStandard.average_growth_by_teacher(teacher:) }

    let(:teacher) { student.teacher }
    let(:student) { create(:student) }

    context "when there are many student standards" do
      before do
        create(:student_standard, student:, quiz_growth: 10)
        create(:student_standard, student:, quiz_growth: 3)
        create_list(:student_standard, 5, quiz_growth: 15)
      end

      it "only count by teacher" do
        is_expected.to eq(6.5)
      end
    end
  end
end
