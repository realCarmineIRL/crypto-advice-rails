class Coin < ApplicationRecord

  has_many :user_coins
  has_many :users, through: :user_coins

  validates :name, :ticker, presence: true

  @@base_uri = 'https://api.coincap.io/v2/assets/'

  def self.new_lookup(name)
    coin_name = name.downcase
    uri = URI(@@base_uri + coin_name)
    res = JSON.parse(Net::HTTP.get(uri))["data"]

    begin
      new(ticker: res["symbol"], name: coin_name, last_price: res["priceUsd"].to_f.round(2))
    rescue => exception
      return nil
    end
  end

  def self.check_db(name)
    where(name: name).first
  end
end
