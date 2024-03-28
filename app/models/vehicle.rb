class Vehicle < ApplicationRecord
  belongs_to :client
  has_many :service_orders
  validates :license_plate, :brand, :model, :client, :color, presence: true
end
