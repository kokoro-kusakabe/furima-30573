class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item =Item.new
  end

  def create
      @item =Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
      @item = Item.find(params[:id])
    if  @item.update(item_params)
        redirect_to "/items/#{@item.id}"
    else
        render :edit
    end
  end


  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    if  @item.order.present? 
      redirect_to action: :index
    elsif  @item.user.id == current_user.id
        render :edit
    else
        redirect_to action: :index
    end
  end

end
