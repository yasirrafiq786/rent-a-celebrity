class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :celebrity
  validates :content, presence: true, length: {maximum: 1000}
end
