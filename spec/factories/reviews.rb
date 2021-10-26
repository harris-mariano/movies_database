FactoryBot.define do
  factory :review do
    movie { nil }
    comment { "MyText" }
    score { 1 }
  end
end
