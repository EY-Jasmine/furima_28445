class DeliveriesController < ApplicationController
  before_action :authenticate_user!
  before_action :delivery_pickup, only: [:show, :edit, :update]

  def index
    @deliveries = Delivery.all
  end
  
  def new
    @delivery = Delivery.new
  end

  def create
    Delivery.create(delivery_params)
  end

  private
  def delivery_params
    params.require(:delivery).permit(:zip_code, :prefecture_id, :city, :address, :tel)
    .merge(user_id: current_user.id, delivery_id: params[:delivery_id])
  end

  def item_pickup
    @delivery = Delivery.find(params[:id])
  end
end
