class Vehicle < ApplicationRecord
  belongs_to :client

  validates :license_plate, :brand, :model, :client, :color, presence: true
end
