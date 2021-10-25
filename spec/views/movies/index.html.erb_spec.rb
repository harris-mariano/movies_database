require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        title: "Title",
        release_year: "Release Year",
        genre: "Genre",
        director: "Director",
        summary: "MyText"
      ),
      Movie.create!(
        title: "Title",
        release_year: "Release Year",
        genre: "Genre",
        director: "Director",
        summary: "MyText"
      )
    ])
  end

  it "renders a list of movies" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Release Year".to_s, count: 2
    assert_select "tr>td", text: "Genre".to_s, count: 2
    assert_select "tr>td", text: "Director".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
