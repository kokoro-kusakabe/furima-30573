class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :show, :update, :move_to_index]
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
  end

  def update
    if  @item.update(item_params)
        redirect_to item_path(@item[:id])
    else
        render :edit
    end
  end


  def show
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


  def move_to_index
    if  @item.order.present? 
      redirect_to action: :index
    elsif  @item.user.id == current_user.id
        render :edit
    else
        redirect_to action: :index
    end
  end

end
