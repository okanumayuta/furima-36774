class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = OrderForm.new
  end

  def create
    @order = OrderForm.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:order_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
