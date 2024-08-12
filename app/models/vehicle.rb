class Vehicle < ApplicationRecord
  validates :brand, :model, :client_id, :color, presence: true

  belongs_to :client
  has_many :service_orders, dependent: :destroy
end