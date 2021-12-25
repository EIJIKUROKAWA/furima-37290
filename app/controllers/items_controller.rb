class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index


  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end  

  private
  def item_params
    params.require(:item).permit(:item_name,:item_text,:item_category_id,:item_condition_id,:postage_included_id,:price,:area_id,:send_day_id,:image).merge(user_id: current_user.id)
  end


end
