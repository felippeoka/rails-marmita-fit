class LunchboxesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @lunchboxes = Lunchbox.all
  end

  def show
    @lunchbox = Lunchbox.find(params[:id])
    @order = Order.new
    @order.user = current_user
    @order.lunchbox = @lunchbox
  end

  def new
    @lunchbox = Lunchbox.new
  end

  def create
    @lunchbox = Lunchbox.new(lunchbox_params)
    @lunchbox.user = current_user
    if @lunchbox.save
      redirect_to lunchboxes_path(@lunchboxes)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @lunchbox = Lunchbox.find(params[:id])

    @lunchbox.destroy if @lunchbox.user == current_user
      redirect_to root_path
  end

  private

  def lunchbox_params
    params.require(:lunchbox).permit(:food, :size, :price, :photo)
  end

  def set_lunchbox
    @lunchbox = Lunchbox.find(params[:lunchbox_id])
  end
end
