class Coin < ApplicationRecord

  @@base_uri = 'https://api.coincap.io/v2/assets/'

  def self.new_lookup(coin_name)
    uri = URI(@@base_uri + coin_name)
    res = JSON.parse(Net::HTTP.get(uri))["data"]

    begin
      new(ticker: res["symbol"], name: coin_name, last_price: res["priceUsd"].to_f.round(2))
    rescue => exception
      return nil
    end
  end
end
