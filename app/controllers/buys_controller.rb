class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :item_pickup, only: [:index, :create]

# itemテーブルからdeliveryへデータを持ってくる
# item_id毎に個別のデータを持ってこれるようにする
  def index
  end

  def create
    Delivery.create(delivery_params)
  end

  private
  def delivery_params
    params.require(:delivery).permit(:zip_code, :prefecture_id, :city, :address, :building, :tel)
    .merge(user_id: current_user.id, delivery_id: params[:delivery_id])
  end

  def item_pickup
    @item = Item.find(params[:item_id])
  end
end
