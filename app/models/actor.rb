# frozen_string_literal: true

class Actor < ApplicationRecord
  # relationships
  has_many :casts, dependent: :destroy
  has_many :movies, through: :casts
  has_attached_file :image, default_url: '/images/:style/missing.png'

  # validations
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :full_name, :image, presence: true
end
