class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reviewed_restaurants, through: :reviews, source: :restaurant
  has_many :reviews
  has_many :restaurants
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  def has_reviewed?(restaurant)
    reviewed_restaurants.include? restaurant
  end

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
   		user.email = auth.info.mail
   		user.password = Devise.friendly_token[0,20]
  	end
	end

end
