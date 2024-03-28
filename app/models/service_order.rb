class ServiceOrder < ApplicationRecord
  belongs_to :client
  belongs_to :vehicle
  validates :client, :vehicle, :mileage, :entry_time, :exit_time, :entry_date, :exit_date, :description, presence: true
end
