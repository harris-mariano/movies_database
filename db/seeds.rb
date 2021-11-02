# frozen_string_literal: true

def seed_image(file_name)
  File.open(File.join("#{Rails.root}/app/assets/images/#{file_name}"))
end

Movie.destroy_all
10.times do |i|
  Movie.create(
    title: "Movie #{i + 1}",
    release_year: rand(2020..2030).to_s,
    genre: 'Action',
    director: 'Harris Mariano',
    story: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '\
             'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '\
             'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip '\
             'ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum '\
             'dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui '\
             'officia deserunt mollit anim id est laborum.',
    image: seed_image('spiderman.jpg')
  )
end
