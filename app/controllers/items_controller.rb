class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # ログインしていないユーザーをログインページの画面に促す
  before_action :set_item, only: [:show, :edit, :update] #重複した記述をまとめる


  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id #ログイン中、他の出品者の編集ページに直接遷移しようとするとトップへ遷移する
      redirect_to root_path
    end
  end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :shipping_cost_id,
                                 :shipping_from_id, :shipping_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
