class CostumesController < ApplicationController
# before_action :set_costume, only: [:show]

  def index
    @costumes = Costume.all
  end

  def show
    @costume = Costume.find(params[:id])
    @booking = Booking.new
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    if @costume.save
      redirect_to costumes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

# def set_costume
#   @costume = costume.find(params[:id])
# end

  def costume_params
    params.require(:costume).permit(:user_id, :price, :description, :photo)
  end
end
