class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :item_pickup, only: [:show, :edit, :update]
  before_action :redirect_toppage, only: [:edit]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      if item.destroy
       redirect_to root_path
      else
       redirect_to item_path(@item.id)
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id,
                                 :condition_id, :delivery_fee_id, :prefecture_id, :day_id, :price, :image)
          .merge(user_id: current_user.id)
  end

  def item_pickup
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def redirect_toppage
    item_pickup
    redirect_to root_path if @item.buy
  end
end
