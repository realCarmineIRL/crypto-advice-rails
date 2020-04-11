class WelcomeController < ApplicationController
  def index
    @coins_count = current_user.coins.count
  end
end
