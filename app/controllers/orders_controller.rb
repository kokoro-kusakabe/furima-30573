class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    @address = Address.new(address_params(order))
    if @order.valid?
      @order.save
      @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params(order)
    params.permit(:postal_code, :area_id, :city, :house_numbe, :phone_number).merge(order_id: order.id)
  end

end
