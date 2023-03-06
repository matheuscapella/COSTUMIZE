class CostumesController < ApplicationController
# before_action :set_costume, only: [:show]

  def index
    @costumes = Costume.all
  end

  def show
    @costume = Costume.find(params[:id])
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

  def destroy
    @costume = Costume.find(params[:id])
    @costume.destroy
    redirect_to costumes_path(@costume), status: :see_other
  end

  private

# def set_costume
#   @costume = costume.find(params[:id])
# end

  def costume_params
    params.require(:costume).permit(:user_id, :price, :title, :description, :photo)
  end
end
