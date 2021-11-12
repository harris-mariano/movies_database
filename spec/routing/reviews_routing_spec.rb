require "rails_helper"

RSpec.describe ReviewsController, type: :routing do
  describe "routing" do
    let(:review) { create(:review, user: user, movie: movie) }

    it "routes to #create" do
      expect(post: "/movies/1/reviews").to route_to("reviews#create", "movie_id"=>"1")
    end

    it "routes to #edit" do
      expect(get: "/movies/1/reviews/1/edit").to route_to("reviews#edit", id: "1", "movie_id"=>"1")
    end

    it "routes to #update via PUT" do
      expect(put: "/movies/1/reviews/1").to route_to("reviews#update", id: "1", "movie_id"=>"1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/movies/1/reviews/1").to route_to("reviews#update", id: "1", "movie_id"=>"1")
    end

    it "routes to #destroy" do
      expect(delete: "/movies/1/reviews/1").to route_to("reviews#destroy", id: "1", "movie_id"=>"1")
    end
  end
end
