# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # relationships
  has_many :reviews
  has_many :favorites, dependent: :destroy
  has_many :movies, through: :favorites
  has_attached_file :image, styles: { medium: '300x300', thumb: '100x100' }, default_url: '/images/:style/missing.png'

  # validations
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :first_name, :last_name, :email, presence: true
  validates :password, confirmation: true
end
