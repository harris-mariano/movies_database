# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Actor, type: :model do
  it 'attributes should not be blank' do
    actor = Actor.new

    expect(actor).to be_invalid
    expect(actor.errors[:full_name]).to be_any
    expect(actor.errors[:image]).to be_any

    actor.full_name = 'harris mariano'
    actor.image = fixture_file_upload(Rails.root.join('spec', 'photos', 'tom.jpg'))
    expect(actor).to be_valid
  end
end
