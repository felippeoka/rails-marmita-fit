class PurchasesController < ApplicationController
  def purchase
    @lunchbox = Lunchbox.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :lunchbox_id)
  end

  def set_lunchbox
    @lunchbox = Order.find(params[:lunchbox_id])
  end
end
