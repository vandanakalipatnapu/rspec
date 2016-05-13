require 'rails_helper'

RSpec.describe "vandanas/edit", type: :view do
  before(:each) do
    @vandana = assign(:vandana, Vandana.create!())
  end

  it "renders the edit vandana form" do
    render

    assert_select "form[action=?][method=?]", vandana_path(@vandana), "post" do
    end
  end
end
