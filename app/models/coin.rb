class Coin < ApplicationRecord

  @@base_uri = 'https://api.coincap.io/v2/assets/'
  
  def self.new_lookup(coin_name)
    uri = URI(@@base_uri + coin_name)
    JSON.parse(Net::HTTP.get(uri))["data"]
  end
end
