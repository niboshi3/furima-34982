class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new
    if @item.user_id == current_user.id || @item.order!= nil
      return redirect_to root_path
    end
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def new
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :telephone_number, :price ).merge(user_id: current_user.id,item_id: @item.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_fc6e27c8b547ff0e4593d41d"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
