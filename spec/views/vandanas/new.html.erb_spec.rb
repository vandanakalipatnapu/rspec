require 'rails_helper'

RSpec.describe "vandanas/new", type: :view do
  before(:each) do
    assign(:vandana, Vandana.new())
  end

  it "renders new vandana form" do
    render

    assert_select "form[action=?][method=?]", vandanas_path, "post" do
    end
  end
end
