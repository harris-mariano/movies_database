require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      title: "MyString",
      release_year: "MyString",
      genre: "MyString",
      director: "MyString",
      summary: "MyText"
    ))
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "input[name=?]", "movie[release_year]"

      assert_select "input[name=?]", "movie[genre]"

      assert_select "input[name=?]", "movie[director]"

      assert_select "textarea[name=?]", "movie[summary]"
    end
  end
end
