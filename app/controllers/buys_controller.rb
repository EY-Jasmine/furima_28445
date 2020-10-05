class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :item_pickup, only: [:index, :create]
  before_action :move_to_top, only: [:index]

  def index
  end

  def new
    @buy = DeliveryBuy.new
  end

  def create
    @buy = DeliveryBuy.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.permit(:price, :zip_code, :prefecture_id, :city, :address, :building, :tel, :user_id, :item_id, :buy_id, :token)
          .merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_top
    item_pickup
    return redirect_to root_path if current_user.id == @item.user_id || @item.buy != nil
  end

  def item_pickup
    @item = Item.find(params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
