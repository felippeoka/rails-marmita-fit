class PagesController < ApplicationController
  def home
  end

  def orders
    @orders = current_user.orders.order('created_at DESC')
  end
end
