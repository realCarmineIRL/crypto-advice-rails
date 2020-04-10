class CoinsController < ApplicationController
  
  def search

    if params[:coin].present?
      @coin = Coin.new_lookup(params[:coin])
      if @coin
        respond_to do |format|
          format.js { render partial: 'users/results' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid coin name to search"
          format.js { render partial: 'users/results' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a coin name to search"
        format.js { render partial: 'users/results' }
      end
    end
  end
end