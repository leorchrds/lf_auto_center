class Client < ApplicationRecord
  validates :name, :phone, presence: true
  has_one :address
  has_many :service_orders
  accepts_nested_attributes_for :address
end
