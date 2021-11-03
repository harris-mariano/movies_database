# frozen_string_literal: true

Dir[Rails.root.join('db/seeders/*.rb')].sort.each do |file|
  puts "Processing #{file.split('/').last}"
  require file
end
