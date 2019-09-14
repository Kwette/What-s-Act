class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :messages
  validates :date, presence: true
  validates :user, presence: true
  validates :activity, presence: true
  validates :total_price, presence: true
  validates :participants_number, presence: true
  validates :status, inclusion: { in: %w[pending accepted declined] }
end
