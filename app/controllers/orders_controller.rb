class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  
    def index
      @order_customer = OrderCustomer.new
      if current_user.id != @item.user_id && !Order.exists?(item_id: @item.id)
        render :index
      elsif 
        current_user.id != @item.user_id && Order.exists?(item_id: @item.id)
        redirect_to root_path
      else
        redirect_to root_path
      end
    end

    def create
      @order_customer = OrderCustomer.new(order_params) 
      if @order_customer.valid?
        pay_item
        @order_customer.save
        redirect_to root_path
      else
        render action: :index
      end
    end
    
      private
      def order_params
        params.require(:order_customer).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
      end

      def set_item
        @item = Item.find(params[:item_id])
      end

      def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
        Payjp::Charge.create(
        amount: @item.item_price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      end
end
