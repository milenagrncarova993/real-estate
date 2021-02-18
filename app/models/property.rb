class Property < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings
  has_many :bookings

  STATE = ["House", "Appartment"]
  TYPE = ["Premium", "Normal", "Simple"]
  validates :address, presence: true
  validates :size, presence: true
  validates :year, presence: true
  validates :price, presence: true
  validates :rooms, presence: true
  validates :type, presence: true
  validates :state, presence: true
  validates :state, inclusion: { in: STATE, message: "Not a valid category" }
  validates :type, inclusion: { in: TYPE, message: "Not a valid category" }
  
end
