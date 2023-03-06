class BookingsController < ApplicationController
  before_action :set_costume, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.costume = @costume
    @booking.save
    redirect_to booking_path(@booking.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def set_costume
    @costume = Costume.find(params[:costume_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end



  # def update
  #   @booking = Booking.find(params[:id])
  #   if @booking.update(booking_params)
  #     # redirect_to # up to you...
  #   else
  #     # render # where was the booking update form?
  #   end
  # end
