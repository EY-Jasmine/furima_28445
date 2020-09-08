class BuysController < ApplicationController
  def create
    Item.create(buy_params)
    redirect_to root_path
  end

  private
  def buy_params
    params.require(:buy).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
