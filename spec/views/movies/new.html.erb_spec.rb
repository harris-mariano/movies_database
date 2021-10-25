require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      title: "MyString",
      release_year: "MyString",
      genre: "MyString",
      director: "MyString",
      summary: "MyText"
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "input[name=?]", "movie[release_year]"

      assert_select "input[name=?]", "movie[genre]"

      assert_select "input[name=?]", "movie[director]"

      assert_select "textarea[name=?]", "movie[summary]"
    end
  end
end
