class ItemsController < ApplicationController

  def index
  end

  def new
    @item =Item.new
  end

  def create
      @item =Item.new(item_prams)
    if @item.save
      redirect_to root_path
    else
      @item =Item.new(item_prams)
      render :new
    end
  end

  private
  def items_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :burden_id, :area_id, :day_id).merge(user_id: current_user.id)
  end
  
end
