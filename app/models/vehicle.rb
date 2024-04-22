class Vehicle < ApplicationRecord
  validates :license_plate, :brand, :model, :client_id, :color, presence: true

  belongs_to :client
  has_many :service_orders
end