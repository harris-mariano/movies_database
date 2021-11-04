# frozen_string_literal: true

include ActionDispatch::TestProcess

FactoryBot.define do
  factory :actor do
    full_name { 'Harris Mariano' }
    image { fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'superman_actor.jpeg'), 'image/jpeg') }
  end
end
