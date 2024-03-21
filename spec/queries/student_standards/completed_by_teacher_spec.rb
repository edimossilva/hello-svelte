# frozen_string_literal: true

require "rails_helper"

RSpec.describe StudentStandards::CompletedByTeacher do
  describe "#StudentStandard.completed_by_teacher" do
    subject { StudentStandard.completed_by_teacher(teacher:, start_date:, end_date:) }

    let(:start_date) { DateTime.new(2024, 1, 1) }
    let(:end_date) { DateTime.new(2024, 12, 31) }
    let(:valid_began_on) { start_date + 1.day }
    let(:invalid_began_on) { start_date - 1.day }
    let(:valid_ended_on) { end_date - 1.day }
    let(:invalid_ended_on) { end_date + 1.day }
    let(:teacher) { student.teacher }
    let(:student) { create(:student) }

    context "when there are many teachers" do
      let(:teacher2) { student2.teacher }
      let(:student2) { create(:student) }

      before do
        create_list(
          :student_standard, 2, student: student, began_on: valid_began_on, ended_on: valid_ended_on,
          final_quiz_score: 100
        )
        create_list(
          :student_standard, 5, student: student2, began_on: valid_began_on, ended_on: valid_ended_on,
          final_quiz_score: 100
        )
      end

      it "only count by teacher" do
        is_expected.to eq(2)
      end
    end

    context "when there are completed and not completed student_standards" do
      before do
        create(
          :student_standard, student:, began_on: valid_began_on, ended_on: valid_ended_on,
          final_quiz_score: 100
        )
        create(
          :student_standard, student:, began_on: valid_began_on, ended_on: valid_ended_on,
          final_quiz_score: 100
        )
        create(
          :student_standard, student:, began_on: valid_began_on, ended_on: valid_ended_on,
          final_quiz_score: nil
        )
      end

      it "only count when final_quiz_score exist" do
        is_expected.to eq(2)
      end
    end

    describe "date range" do
      before do
        create(
          :student_standard, student:, began_on:, ended_on:,
          final_quiz_score: 100
        )
      end

      context "when began_on is out of range" do
        let(:began_on) { invalid_began_on }
        let(:ended_on) { valid_ended_on }

        it { is_expected.to eq(0) }
      end

      context "when ended_on is out of range" do
        let(:began_on) { valid_began_on }
        let(:ended_on) { invalid_ended_on }

        it { is_expected.to eq(0) }
      end

      context "when began_on and ended_on are out of range" do
        let(:began_on) { invalid_began_on }
        let(:ended_on) { invalid_ended_on }

        it { is_expected.to eq(0) }
      end

      context "when began_on and ended_on are not out of range" do
        let(:began_on) { valid_began_on }
        let(:ended_on) { valid_ended_on }

        it { is_expected.to eq(1) }
      end
    end
  end
end
