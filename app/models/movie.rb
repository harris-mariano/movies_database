# frozen_string_literal: true

# movie model
class Movie < ApplicationRecord
  # relationships
  has_many :casts, dependent: :destroy
  has_many :actors, through: :casts
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_attached_file :image, styles: { medium: '400x600>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'

  # validations
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, :release_year, :genre, :director, :summary, :image, presence: true
end
