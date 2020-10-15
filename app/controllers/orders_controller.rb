class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    @address = Address.new(address_params(@order))
    if  @order.valid?
        pay_item
        @order.save
        @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit().merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def address_params(order)
    params.permit(:postal_code, :area_id, :city, :house_number, :phone_number).merge(order_id: order.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
