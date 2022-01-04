class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @purchase_record_shipping = PurchaseRecordShipping.new
  end

  def create
    @purchase_record_shipping = PurchaseRecordShipping.new(purchase_params)
    if @purchase_record_shipping.valid?
      pay_item
      @purchase_record_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_record_shipping).permit(:shipping_number, :area_id, :shipping_city, :shipping_address, :shipping_building, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,        # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end

  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase_record.present?
  end
end
