FactoryBot.define do
  factory :review do
    movie
    user
    comment { 'Sample comment' }
    score { 5 }
  end
end
