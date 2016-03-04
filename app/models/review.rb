class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  #has_many :reviewed_restaurants, through: :reviews, source: :restaurant
  validates :rating, inclusion: (1..5)
end
