class LunchboxesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query]
    # @lunchboxes = Lunchbox.where(food: params[:query])
    @lunchboxes = Lunchbox.where("food ILIKE ?", "%#{params[:query]}%")
    else
    @lunchboxes = Lunchbox.all
    end
  end

  def show
    @lunchbox = Lunchbox.find(params[:id])
    @order = Order.new
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
