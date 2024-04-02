class ServiceOrder < ApplicationRecord
  belongs_to :client
  belongs_to :vehicle
  has_one :address, through: :client
  validates :client, :mileage, :entry_time, :exit_time, :entry_date, :exit_date, :description, presence: true
end