class DeliveriesController < ApplicationController
  def create
    Delivery.create(delivery_params)
    redirect_to root_path
  end

  private
  def delivery_params
    params.require(:delivery).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
