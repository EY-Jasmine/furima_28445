class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :item_pickup, only: [:index, :create]

  def index
  end

  def new
    @buy = DeliveryBuy.new
  end

  def create
    @buy = DeliveryBuy.new(buy_params)
    if @buy.save
      redirect_to root_path
    else
      render 'index'      
    end    
  end

  private
  def buy_params
    params.permit(:zip_code, :prefecture_id, :city, :address, :building, :tel, :user_id, :item_id)
    .merge(user_id: current_user.id)
  end

  def item_pickup
    @item = Item.find(params[:item_id])
  end
end
