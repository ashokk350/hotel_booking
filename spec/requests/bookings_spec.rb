require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe "GET #index" do
    it "returns a success response" do
      get '/index', format: :json
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "returns a success response" do
      params = {
        booking: {
                    hotel_id: 1,
                    number_of_rooms: '2',
                    check_in_date: '12/04/2024',
                    check_out_date: '15/04/2024',
                    status: 'booked',
                    user_id: 1 
                }
      }

      post '/create', params: params, format: :json
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    it "returns a success response" do
        booking = {
                    hotel_id: 1,
                    number_of_rooms: '2',
                    check_in_date: '12/04/2024',
                    check_out_date: '15/04/2024',
                    status: 'booked',
                    user_id: 1 
                }

      put '/update', params: { id: 1, booking: booking }, format: :json
      expect(response).to be_successful
    end
  end

  describe "PUT #cancel" do
    it "returns a success response" do
      put '/cancel', params:  { id: 1 }, format: :json
      expect(response).to be_successful
    end
  end
end
