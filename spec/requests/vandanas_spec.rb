require 'rails_helper'

RSpec.describe "Vandanas", type: :request do
  describe "GET /vandanas" do
    it "works! (now write some real specs)" do
      get vandanas_path
      expect(response).to have_http_status(200)
    end
  end
end
