class OrdersController < ApplicationController

  def index
    @order = Order.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def order_address
    params.require(:order_address).permit(:post_code, :shipping_from_id, :city, :block_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

