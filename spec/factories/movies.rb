# frozen_string_literal: true

include ActionDispatch::TestProcess

FactoryBot.define do
  factory :movie do
    title { 'Harry Potter' }
    release_year { '2020' }
    genre { 'Action' }
    director { 'Harry Potter' }
    story { 'Sample story' }
    image { fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'harry_potter.jpeg'), 'image/jpeg') }
  end
end
