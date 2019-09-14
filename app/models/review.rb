class Review < ApplicationRecord
  belongs_to :activity
  validates :content, :rating, :activity, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5]}
end
