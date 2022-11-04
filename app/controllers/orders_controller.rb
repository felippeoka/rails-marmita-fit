class OrdersController < ApplicationController
  def new
    @order = Order.new
    @lunchbox = Lunchbox.find(params[:lunchbox_id])
    # @order.user = current_user
    # @order.lunchbox = @lunchbox
  end

  def create
    @order = Order.new
    @lunchbox = Lunchbox.find(params[:lunchbox_id])
    @order.lunchbox = @lunchbox
    @order.user = current_user
    if @order.save
      redirect_to lunchbox_path(@lunchbox)
    else
      render :new, status: :unprocessable_entity
    end
    raise
  end

  def show
    @order = Order.find(params[:id])
  end

  # def destroy
  #   @order = Order.find(params[:id])
  #   @order.destroy
  # end
end
