class User < ApplicationRecord

  has_many :user_coins
  has_many :coins, through: :user_coins
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def coin_already_tracked?(name)
    coin = Coin.check_db(name)
    return false unless coin
    coins.where(id: coin.id).exists?
  end

  def under_coin_limit?
    coins.count < 10
  end

  def can_track_coin?(name)
    under_coin_limit? && !coin_already_tracked?(name)
  end
end
