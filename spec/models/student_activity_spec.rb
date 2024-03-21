# frozen_string_literal: true

require "rails_helper"

RSpec.describe StudentActivity do
  subject { build(:student_activity) }

  it { is_expected.to belong_to(:student_standard) }
  it { is_expected.to belong_to(:activity) }
end
