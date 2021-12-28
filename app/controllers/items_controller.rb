class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all.order("created_at DESC")
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
    params.require(:item).permit(:item_name, :item_text, :item_category_id, :item_condition_id, :postage_included_id, :area_id, :price,
                                 :send_day_id, :image).merge(user_id: current_user.id)
  end
end
