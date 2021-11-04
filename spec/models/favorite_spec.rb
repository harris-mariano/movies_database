require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:movie) { create(:movie) }
  let(:user) { create(:user) }
  let(:favorite) { build(:favorite, movie: movie, user: user) }

  it 'is valid with valid attributes' do
    expect(favorite).to be_valid
  end

  it 'is not valid without user' do
    favorite.user = nil
    expect(favorite).to be_invalid
  end

  it 'is not valid without movie' do
    favorite.movie = nil
    expect(favorite).to be_invalid
  end
end
