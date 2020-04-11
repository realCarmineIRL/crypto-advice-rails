class WelcomeController < ApplicationController
  def index
    @coins_count = current_user.coins.count
    @sentiment_score = sentiment_score
  end

  def sentiment_score
    sentiment = Sentiment.first
    sentiment.score
  end
end
