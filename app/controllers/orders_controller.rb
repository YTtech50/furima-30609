class OrdersController < ApplicationController
  
    def index
      @item = Item.find(params[:item_id])
      @order_customer = OrderCustomer.new
    end

    def create
      @order_customer = OrderCustomer.new(order_params)   
      if @order_customer.valid?
        @order_customer.save
        redirect_to root_path
      else
        @item = Item.find(params[:item_id])
        render action: :index
      end
    end
    
      private
      def order_params
        params.require(:order_customer).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id)
      end
end
