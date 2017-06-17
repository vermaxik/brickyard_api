require 'rails_helper'

RSpec.describe Main, type: :model do
  it { should validate_presence_of(:state) }
end
