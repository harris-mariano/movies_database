# frozen_string_literal: true

include ActionDispatch::TestProcess

FactoryBot.define do
  factory :user do
    first_name { 'Harris' }
    last_name { 'Mariano' }
    email { 'harris@admin.com' }
    password { 'password' }
    admin { true }
    image { fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'superman_actor.jpeg'), 'image/jpeg') }
  end
end
