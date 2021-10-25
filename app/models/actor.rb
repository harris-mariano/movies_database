# frozen_string_literal: true

class Actor < ApplicationRecord
  has_attached_file :image, styles: { medium: '400x600' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :full_name, :image, presence: true
end
