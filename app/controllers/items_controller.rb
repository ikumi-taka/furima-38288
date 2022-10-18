class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index] # ログインしていないユーザーをログインページの画面に促す

  def index
  end
end
