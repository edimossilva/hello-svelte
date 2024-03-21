# frozen_string_literal: true

require "rails_helper"

RSpec.describe StudentActivities::PositiveRatingPercentageByTeacher do
  describe "#StudentActivities.positive_rating_percentage_by_teacher" do
    subject { StudentActivity.positive_rating_percentage_by_teacher(teacher:) }

    context "when there are many student standards" do
      let(:teacher) { student_standard.student.teacher }
      let(:student_standard) { create(:student_standard) }

      before do
        create(:student_activity, student_standard:, rated_positively: true)
        create(:student_activity, student_standard:, rated_positively: true)
        create(:student_activity, student_standard:, rated_positively: true)
        create(:student_activity, student_standard:, rated_positively: false)
        create(:student_activity, rated_positively: false)
      end

      it "calculates percentage" do
        is_expected.to eq(75.0)
      end
    end

    context "when there are no student activities" do
      let(:teacher) { create(:teacher) }

      it "returns empty" do
        is_expected.to be_empty
      end
    end

    context "when used together with other scope" do
      subject { StudentActivity.positive_rating_percentage_by_teacher(teacher:, scope: by_activity_scope) }

      let(:by_activity_scope) { StudentActivity.by_activity(activity:) }
      let(:teacher) { student_standard.student.teacher }
      let(:student_standard) { create(:student_standard) }
      let(:activity) { create(:activity) }

      before do
        create(:student_activity, student_standard:, rated_positively: true, activity:)
        create(:student_activity, student_standard:, rated_positively: true)
        create(:student_activity, student_standard:, rated_positively: true)
        create(:student_activity, student_standard:, rated_positively: false, activity:)
        create(:student_activity, rated_positively: false)
        create(:student_activity, rated_positively: false)
      end

      it "calculates percentage only considering the activity" do
        is_expected.to eq(50.0)
      end
    end
  end
end
