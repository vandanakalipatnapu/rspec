require 'rails_helper'

RSpec.describe "vandanas/index", type: :view do
  before(:each) do
    assign(:vandanas, [
      Vandana.create!(),
      Vandana.create!()
    ])
  end

  it "renders a list of vandanas" do
    render
  end
end
