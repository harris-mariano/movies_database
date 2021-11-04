# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Actor, type: :model do
  let(:actor) { build(:actor) }

  it 'is valid with valid attributes' do
    expect(actor).to be_valid
  end

  it 'is not valid without full name' do
    actor.full_name = nil
    expect(actor).to be_invalid
  end

  it 'is not valid without image' do
    actor.image = nil
    expect(actor).to be_invalid
  end
end
