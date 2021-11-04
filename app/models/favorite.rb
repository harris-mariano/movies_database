class Favorite < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :movie_id, :user_id, presence: true
end
