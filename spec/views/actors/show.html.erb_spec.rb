require 'rails_helper'

RSpec.describe "actors/show", type: :view do
  before(:each) do
    @actor = assign(:actor, Actor.create!(
      full_name: "Full Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name/)
  end
end
