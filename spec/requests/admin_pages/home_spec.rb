require 'rails_helper'

RSpec.describe "AdminPages::Homes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin_pages/home/index"
      expect(response).to have_http_status(:success)
    end
  end

end
