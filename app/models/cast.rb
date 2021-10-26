# frozen_string_literal: true

class Cast < ApplicationRecord
  #relationships
  belongs_to :movie
  belongs_to :actor

  # validations
  validates :movie_id, :actor_id, presence: true
end
