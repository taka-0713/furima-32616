class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :sold_out
  before_action :identification

  def index
    @order_address = OrderAddress.new
  end


  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
       return redirect_to root_path
    else
       render :index
    end
  end

  private

  def order_params
    item = Item.find(params[:item_id])
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipalities, :block_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item.id, token: params[:token], item: item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: order_params[:item],
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sold_out
    @item = Item.find(params[:item_id])
    if @item.order != nil
      redirect_to root_path
    end
  end

  def identification
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

end