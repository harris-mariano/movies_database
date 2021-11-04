require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without first name' do
    user.first_name = nil
    expect(user).to be_invalid
  end

  it 'is not valid without last name' do
    user.last_name = nil
    expect(user).to be_invalid
  end

  it 'is not valid without email' do
    user.email = nil
    expect(user).to be_invalid
  end
end
