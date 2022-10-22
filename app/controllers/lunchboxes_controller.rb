class LunchboxesController < ApplicationController
  def index
    @lunchboxes = Lunchbox.all
  end

  def show
    @lunchbox = Lunchbox.find(params[:id])
  end

  def new
    @lunchbox = Lunchbox.new
  end

  def create
    @lunchbox = Lunchbox.new(lunchbox_params)
    if @lunchbox.save
      redirect_to lunchbox_list(@lunchbox)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @lunchbox = Lunchbox.find(params[:id])
    @lunchbox.destroy
  end

  private

  def lunchbox_params
    params.require(:lunchbox).permit(:food, :size, :price)
  end

  def set_lunchbox
    @lunchbox = Lunchbox.find(params[:lunchbox_id])
  end
end
