require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  let(:movie) { create(:movie) }
  let(:user) { create(:user) }
  
  it 'should be added and removed to user favorites' do
    login(user)
    get movie_url(movie)

    expect {
      post movie_add_to_favorites_url(movie)
    }.to change(Favorite, :count).by(1)

    expect {
      delete movie_remove_from_favorites_url(movie)
    }.to change(Favorite, :count).by(-1)
  end
end
