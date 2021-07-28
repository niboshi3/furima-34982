class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :search_params , only: [:index, :create]
  #before_action :set_order,only: [:index, :create]

  def index
    @order_shipping_address = OrderShippingAddress.new
    if @item.user_id == current_user.id || @item.order!= nil
      return redirect_to root_path
    end
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def search_params
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.order!= nil
      return redirect_to root_path
    end
  end

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :telephone_number, :price ).merge(user_id: current_user.id,item_id: @item.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵(環境変数)
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
