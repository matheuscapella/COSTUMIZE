class CostumesController < ApplicationController
  def index
    if params[:query].present?
      @costumes = Costume.search_by_title_and_description(params[:query])
    else
      @costumes = Costume.all
    end
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
    if @costume.save!
      redirect_to costumes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @costume = Costume.find(params[:id])
    @costume.destroy
    redirect_to costumes_path(@costume), status: :see_other
  end

  private

  def costume_params
    params.require(:costume).permit(:user_id, :price, :title, :description, :photo)
  end
end
