class ShippingAddress < ApplicationRecord
  belongs_to :member

  validates :postcode, presence: true
  validates :address, presence: true
  validates :addressee, presence: true
end
