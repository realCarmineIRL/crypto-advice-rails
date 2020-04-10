class UserCoinsController < ApplicationController

  def create
    coin = Coin.check_db(params[:name])
    
    if coin.blank?
      coin = Coin.new_lookup(params[:name])
    end

    coin.save

    @user_coin = UserCoin.create(user: current_user, coin: coin)
    flash[:notice] = "Coin #{coin.name} was successfully added to your portfolio"
    redirect_to my_portfolio_path
  end

  def destroy
    coin = Coin.find(params[:id])
    user_coin = UserCoin.where(user_id: current_user.id, coin_id: coin.id).first
    user_coin.destroy
    flash[:notice] = "#{coin.name} was successfully removed from portfolio"
    redirect_to my_portfolio_path
  end
end
