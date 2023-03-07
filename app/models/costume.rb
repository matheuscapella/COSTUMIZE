class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
