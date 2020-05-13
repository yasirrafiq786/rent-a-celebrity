class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :celebrity
  validates :user, uniqueness: {scope: :celebrity}
  validates :celebrity, presence: true
  validates :status, inclusion: {in: %w(pending confirmed rejected)}
  validates :start_date, presence: true
  validates :end_date, presence: true
end
