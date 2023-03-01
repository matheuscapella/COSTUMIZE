class CostumesController < ApplicationController
# before_action :set_costume, only: [:show]

  def index
    @costumes = Costume.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    if @costume.save
      redirect_to costume_path(@costume)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

# def set_costume
#   @costume = costume.find(params[:id])
# end

  def costume_params
    params.require(:costume).permit(:owner_id, :price, :description)
  end
end
