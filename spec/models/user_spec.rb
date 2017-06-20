require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:login) }
  it { should validate_presence_of(:password) }
  it { should validate_confirmation_of(:password) }
  it { should validate_presence_of(:password_confirmation) }

  it { should have_secure_password }

  it 'Check existing roles' do
    should define_enum_for(:role).
      with([:user, :admin])
  end

end
