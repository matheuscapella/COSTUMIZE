class BookingsController < ApplicationController

  def show
    @booking = Booking.new
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(params[:booking])
  end
end
