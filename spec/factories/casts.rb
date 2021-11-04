FactoryBot.define do
  factory :cast do
    movie
    actor
    character_name { 'Superman' }
  end
end
