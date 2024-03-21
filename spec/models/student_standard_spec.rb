# frozen_string_literal: true

require "rails_helper"

RSpec.describe StudentStandard do
  subject { build(:student_standard) }

  it { is_expected.to belong_to(:student) }
end
