class BookingsController < ApplicationController

  # def show
  #   @booking = Booking.new
  # end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      # redirect_to # up to you...
    else
      # render # where was the booking update form?
    end
  end

  # def approve
  #   @booking = Booking.find_by_id(params[:id])
  #    @booking.update(state: "approved")
  #    if @booking.state == "approved"
  #      flash[:success] = "Booking successfully approved"
  #      redirect_to bookings_path
  #    else
  #      flash[:error] = "Booking not approved"
  #      redirect_to bookings_path
  #    end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
