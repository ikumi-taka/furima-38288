class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index] # ログインしていないユーザーをログインページの画面に促す

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :shipping_cost_id,
                                 :shipping_from_id, :shipping_time_id, :price).merge(user_id: current_user.id)
  end
end
