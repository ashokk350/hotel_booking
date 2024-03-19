require 'rails_helper'

RSpec.describe "Hotels", type: :request do
  describe "GET #index" do
    it "returns a success response" do
      get '/index', format: :json
      expect(response).to be_successful
    end
  end
end
