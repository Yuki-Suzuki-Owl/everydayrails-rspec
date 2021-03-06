require 'rails_helper'

# RSpec.describe "Homes", type: :request do
RSpec.describe HomeController, type: :controller do
  describe "#index" do
    it "responds successfully" do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status "200"
    end
  end

end
