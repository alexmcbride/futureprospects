class Reference < ApplicationRecord
  validates :full_name, presence: true, length: {maximum: 70}
  validates :occupation, presence: true, length: {maximum: 35}
  validates :relationship, presence: true, length: {maximum: 35}
  validates :address_1, presence: true, length: {maximum: 35}
  validates :address_2, presence: false, length: {maximum: 35}
  validates :country, presence: true, length: {maximum: 35}
  validates :post_code, presence: true, length: {maximum: 8}
  validates :telephone, presence: true, length: {maximum: 12}
  validates :email, presence: true, length: {maximum: 254}

  belongs_to :application
end
