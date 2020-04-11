class WelcomeController < ApplicationController
  def index
    @coins_count = current_user.coins.count
    @sentiment_score = sentiment_score
  end

  def sentiment_score
    90
  end
end
