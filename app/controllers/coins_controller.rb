class CoinsController < ApplicationController
  
  def search

    if params[:coin].present?
      @coin = Coin.new_lookup(params[:coin])
      if @coin
        render 'users/my_portfolio'
      else
        flash[:alert] = "Please enter a valid coin name to search"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Please enter a coin name to search"
      redirect_to my_portfolio_path
    end
  end
end