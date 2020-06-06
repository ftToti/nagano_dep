class ShippingAddress < ApplicationRecord
  belongs_to :member

  validates :postcode, presence: true
  validates :address, presence: true
  validates :addressee, presence: true


  def deli
  	self.postcode + self.address + self.addressee
  end
end
