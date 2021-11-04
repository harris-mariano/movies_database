require 'rails_helper'

RSpec.describe Cast, type: :model do
  let(:actor) { create(:actor) }
  let(:movie) { create(:movie) }
  let(:cast) { build(:cast, movie: movie, actor: actor) }

  it 'is valid with valid attributes' do
    expect(cast).to be_valid
  end

  it 'is not valid without character name' do
    cast.character_name = nil
    expect(cast).to be_invalid
  end

  it 'is not valid without movie' do
    cast.movie = nil
    expect(cast).to be_invalid
  end

  it 'is not valid without actor' do
    cast.actor = nil
    expect(cast).to be_invalid
  end
end
