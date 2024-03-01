class BookingsController < ApplicationController
  before_action :set_flat, only: %i[new create]

  def index
    @bookings = current_user.bookings
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(status: "accepted")
    redirect_to flat_path(set_flat)
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    @booking.save

    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to new_user_session_path()
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @flat = @booking.flat
    @booking.destroy
    redirect_to flat_path(@flat)
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def booking_params
    params.require(:booking).permit(:request_date)
  end
end
