class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :request_date, presence: true
end
