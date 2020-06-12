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

    def Member.search(search, member_or_product, how_search)
      if member_or_product == "1"
      if how_search == "1"
        Member.where(["first_name LIKE ?", "%#{search}%"])
      elsif how_search == "2"
        Member.where(["first_name LIKE ?", "%#{search}"])
      elsif how_search == "3"
        Member.where(["first_name LIKE ?", "#{search}%"])
      elsif how_search == "4"
        Member.where(["first_name LIKE ?", "#{search}"])   
      else
        Member.all
      end
    end
    end

end
