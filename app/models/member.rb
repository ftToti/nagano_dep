class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :cart_items, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :shipping_addresses, dependent: :destroy

    validates :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, presence: true

    def active_for_authentication?
    super && (self.is_enabled == true)
  	end

    def Member.search(search, member_or_product)
      if member_or_product == "1"
        Member.where(["first_name  LIKE ? OR last_name LIKE ?", "%#{search}%", "%#{search}%"])
      end
    end

end
