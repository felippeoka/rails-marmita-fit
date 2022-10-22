class OrdersController < ApplicationController
  before_action :set_lunchbox, only: [:new, :create]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.lunchbox = @lunchbox
    if @order.save
      redirect_to lunchbox_path(@lunchbox)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :lunchbox_id)
  end

  def set_lunchbox
    @lunchbox = Order.find(params[:lunchbox_id])
  end
end
