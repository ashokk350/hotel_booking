class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy cancel]

  def index
    @bookings = Booking.all.order(created_at: :desc)

    render 'index', formats: :json
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def cancel
    if @booking.update(status: 'canceled')
      render json: @booking, status: :ok
    else
      render json: @booking, status: :unprocessable_entity
    end
  end

  def create
    booking = Booking.new(add_room_details)

    if booking.save
      render json: booking, status: :created
    else
      render json: booking, status: :unprocessable_entity
    end
  end

  def update
    if @booking.update(booking_params)
      render json: @booking, status: :ok
    else
      render json: @booking, status: :unprocessable_entity
    end
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:user_id, :room_id, :status, :check_in_date, :check_out_date)
    end

    def add_room_details
      rooms = Room.available_rooms(booking_params[:check_in_date], booking_params[:check_out_date], params[:booking][:hotel_id])
      rooms = rooms.first(params[:booking][:number_of_rooms].to_i)

      unless rooms.present?
        render json: { message: "Rooms are not available." }, status: :unprocessable_entity
      end

      new_params = booking_params.to_h
      new_params[:room_bookings_attributes] = []

      rooms.each do |room|
        new_params[:room_bookings_attributes] << { room_id: room.id.to_s }
      end

      new_params
    end
end
