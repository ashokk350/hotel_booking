class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[ show edit update destroy ]

  def index
    if params[:location].present?
      hotels = Hotel.where("location ILIKE ?", "%#{params[:location]}%")
    else
      hotels = Hotel.all
    end

    render json: hotels
  end
end
