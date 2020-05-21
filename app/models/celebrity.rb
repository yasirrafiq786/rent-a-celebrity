class Celebrity < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :price_per_day, presence: true
  validates :description, presence: true
  validates :photos, presence: true
  validates :location, presence: true
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def avg_rating(array)
    array.sum.fdiv(array.length)
  end  

end
