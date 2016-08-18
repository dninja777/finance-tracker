class UserStocksController < ApplicationController
  before_action :set_user_stock, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_stocks = UserStock.all
    respond_with(@user_stocks)
  end

  def show
    respond_with(@user_stock)
  end

  def new
    @user_stock = UserStock.new
    respond_with(@user_stock)
  end

  def edit
  end

  def create
    @user_stock = UserStock.new(user_stock_params)
    @user_stock.save
    respond_with(@user_stock)
  end

  def update
    @user_stock.update(user_stock_params)
    respond_with(@user_stock)
  end

  def destroy
    @user_stock.destroy
    respond_with(@user_stock)
  end

  private
    def set_user_stock
      @user_stock = UserStock.find(params[:id])
    end

    def user_stock_params
      params.require(:user_stock).permit(:user_id, :stock_id)
    end
end
