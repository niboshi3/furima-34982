class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @items = Item.order("created_at DESC")
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:image,:item_name,:appeal_point,:category_id,:status_id,:shipping_charge_id,:prefecture_id,:shipping_date_id,:price).merge(user_id: current_user.id)
  end

end
