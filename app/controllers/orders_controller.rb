class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]
  
  def index
    
    
    @purchase_record_shipping = PurchaseRecordShipping.new
  
    
  end

  def new
    
  end
  
  def create

    @purchase_record_shipping = PurchaseRecordShipping.new(purchase_params)
     
    if @purchase_record_shipping.valid?
      @purchase_record_shipping.save
      redirect_to root_path
    else
      render "index"
    end
  end
  
  private

 
  def purchase_params
    params.require(:purchase_record_shipping).permit(:shipping_number, :area_id, :shipping_city, :shipping_address, :shipping_building, :telephone_number, :purchase_record_id, :item_id).merge(user_id: current_user.id)
  end
  def non_purchased_item
    
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase_record.present?
  end
end
