# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'attributes should not be blank' do
    movie = Movie.new

    expect(movie).to be_invalid
    expect(movie.errors[:title]).to be_any
    expect(movie.errors[:release_year]).to be_any
    expect(movie.errors[:genre]).to be_any
    expect(movie.errors[:director]).to be_any
    expect(movie.errors[:summary]).to be_any
    expect(movie.errors[:image]).to be_any

    movie.title = 'sample title'
    movie.release_year = '2020'
    movie.genre = 'action'
    movie.director = 'harris'
    movie.summary = 'summary'
    movie.image = fixture_file_upload(Rails.root.join('spec', 'photos', 'maze_runner.jpg'))

    expect(movie).to be_valid
  end
end
