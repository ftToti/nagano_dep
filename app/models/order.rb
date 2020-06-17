class Order < ApplicationRecord
  belongs_to :member
  has_many :order_products, dependent: :destroy

  validates :postcode, :address, :addressee, presence: true

end
