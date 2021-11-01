# frozen_string_literal: true

class Review < ApplicationRecord
  # relationships
  belongs_to :movie
  belongs_to :user

  # validations
  validates :movie_id, :user_id, :comment, :score, presence: true
  validates :score, inclusion: 1..5

  def belongs_to_current_user?(current_user)
    user == current_user
  end
end
