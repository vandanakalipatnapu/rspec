require 'rails_helper'

RSpec.describe "vandanas/show", type: :view do
  before(:each) do
    @vandana = assign(:vandana, Vandana.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
