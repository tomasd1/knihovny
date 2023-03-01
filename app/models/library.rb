class Library < ApplicationRecord
  belongs_to :region
  belongs_to :district
  belongs_to :orp
  belongs_to :city

  validates :region, :district, :orp, :city, presence: true

  validates :name, :ico, :street, :premise, :postcode, presence: true

  validates :ico, length: { maximum: 8 }
  validates :ico, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :premise, length: { maximum: 5 }
  validates :postcode, length: { maximum: 5 }
  validates :x, :y, numericality: true
  validates :x, :y, length: { maximum: 7 }

end
