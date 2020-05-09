class Celebrity < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :price_per_day, presence: true
  validates :description, presence: true
end
