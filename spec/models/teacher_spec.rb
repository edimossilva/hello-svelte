# frozen_string_literal: true

require "rails_helper"

RSpec.describe Teacher do
  subject { build(:teacher) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:students).dependent(:nullify) }
  it { is_expected.to have_many(:student_standards).through(:students) }
end
