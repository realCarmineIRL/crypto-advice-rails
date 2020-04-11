class UsersController < ApplicationController
  def my_portfolio
    current_user.coins.each do |coin|
      Coin.update_price(coin.name)
    end
    @tracked_coins = current_user.coins
  end
end
