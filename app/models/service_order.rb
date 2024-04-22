class ServiceOrder < ApplicationRecord
  belongs_to :client
  belongs_to :vehicle
  has_one :address, through: :client
end