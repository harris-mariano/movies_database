# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) { build(:movie) }

  it 'is valid with valid attributes' do
    expect(movie).to be_valid
  end

  it 'is not valid without title' do
    movie.title = nil
    expect(movie).to be_invalid
  end

  it 'is not valid without release_year' do
    movie.release_year = nil
    expect(movie).to be_invalid
  end

  it 'is not valid without genre' do
    movie.genre = nil
    expect(movie).to be_invalid
  end

  it 'is not valid without director' do
    movie.director = nil
    expect(movie).to be_invalid
  end

  it 'is not valid without story' do
    movie.story = nil
    expect(movie).to be_invalid
  end

  it 'is not valid without image' do
    movie.image = nil
    expect(movie).to be_invalid
  end
end
