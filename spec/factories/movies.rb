# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { 'Superman' }
    release_year { '2020' }
    genre { 'Action' }
    director { 'Harris Mariano' }
    summary { 'Sample summary' }
    image { fixture_file_upload(Rails.root.join('spec', 'photos', 'maze_runner.jpg'), 'image/jpg') }
  end
end
