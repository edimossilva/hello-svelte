# frozen_string_literal: true

require "rails_helper"

RSpec.describe Student do
  subject { build(:student) }

  it { is_expected.to belong_to(:teacher) }
  it { is_expected.to have_many(:student_standards).dependent(:destroy) }
end
