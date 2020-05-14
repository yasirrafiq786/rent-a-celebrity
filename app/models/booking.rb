class Booking < ApplicationRecord
  validate :start_date_cannot_be_after_end_date
  belongs_to :user
  belongs_to :celebrity
  validates :user, uniqueness: {scope: :celebrity}
  validates :celebrity, presence: true
  validates :status, inclusion: {in: %w(pending confirmed rejected)}
  validates :start_date, presence: true
  validates :end_date, presence: true

  def start_date_cannot_be_after_end_date
    if start_date > end_date
      errors.add(:start_date, "cannot be after the end date")
    end
  end
 
end
