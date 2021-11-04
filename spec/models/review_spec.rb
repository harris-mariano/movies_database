require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { create(:user) }
  let(:movie) { create(:movie) }
  let(:review) { build(:review, movie: movie, user: user) }

  it 'is valid with valid attributes' do
    expect(review).to be_valid
  end

  it 'is not valid without comment' do
    review.comment = nil
    expect(review).to be_invalid
  end

  it 'is not valid without score' do
    review.score = nil
    expect(review).to be_invalid
  end

  it 'is not valid without movie' do
    review.movie = nil
    expect(review).to be_invalid
  end

  it 'is not valid without user' do
    review.user = nil
    expect(review).to be_invalid
  end
end
