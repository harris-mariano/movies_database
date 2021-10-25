class Movie < ApplicationRecord
  has_attached_file :image, styles: { medium: "400x600>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, :release_year, :genre, :director, :summary, :image, presence: true
end
