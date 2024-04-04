class ServiceOrder < ApplicationRecord
  belongs_to :client, optional: true 
  belongs_to :vehicle 
  has_one :address, through: :client
end