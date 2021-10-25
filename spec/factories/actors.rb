# frozen_string_literal: true

FactoryBot.define do
  factory :actor do
    full_name { 'Harris Mariano' }
    image { fixture_file_upload(Rails.root.join('spec', 'photos', 'tom.jpg'), 'image/jpg') }
  end
end
