# frozen_string_literal: true

class Review < ApplicationRecord
  # relationships
  belongs_to :movie
  belongs_to :user

  # validations
  validates :movie_id, :user_id, :comment, :score, presence: true
end
