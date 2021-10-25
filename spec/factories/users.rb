# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    full_name { 'Harris Mariano' }
    email { 'harris@test.com' }
    encrypted_password { 'password' }
    admin { true }
  end
end
