# frozen_string_literal: true

# movie model
class Movie < ApplicationRecord
  # relationships
  has_many :casts, dependent: :destroy
  has_many :actors, through: :casts
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_attached_file :image, default_url: '/images/:style/missing.png'

  # validations
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, :release_year, :genre, :director, :story, :image, presence: true

  def average_rating
    reviews.average(:score)
  end

  def user_favorite?(current_user)
    current_user.movies.where(id: id).any?
  end
end
