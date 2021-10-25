require 'rails_helper'

RSpec.describe "actors/index", type: :view do
  before(:each) do
    assign(:actors, [
      Actor.create!(
        full_name: "Full Name"
      ),
      Actor.create!(
        full_name: "Full Name"
      )
    ])
  end

  it "renders a list of actors" do
    render
    assert_select "tr>td", text: "Full Name".to_s, count: 2
  end
end
