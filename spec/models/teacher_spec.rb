# frozen_string_literal: true

require "rails_helper"

RSpec.describe Teacher do
  subject { build(:teacher) }

  it { is_expected.to belong_to(:user) }
end
