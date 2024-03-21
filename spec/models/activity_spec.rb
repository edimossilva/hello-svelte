# frozen_string_literal: true

require "rails_helper"

RSpec.describe Activity do
  it { is_expected.to have_many(:student_activities).dependent(:destroy) }
end
