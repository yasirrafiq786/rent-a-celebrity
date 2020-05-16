class Celebrity < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :price_per_day, presence: true
  validates :description, presence: true
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
