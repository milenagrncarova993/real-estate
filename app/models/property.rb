class Property < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings
  has_many :bookings
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  CATEGORY1 = ["House", "Appartment"]
  CATEGORY2 = ["Premium", "Normal", "Simple"]
  validates :address, presence: true
  validates :size, presence: true
  validates :year, presence: true
  validates :price, presence: true
  validates :rooms, presence: true
  validates :type_of_property, presence: true
  validates :state, presence: true
  validates :state, inclusion: { in: CATEGORY2, message: "Not a valid category" }
  validates :type_of_property, inclusion: { in: CATEGORY1, message: "Not a valid category" }
  
end
