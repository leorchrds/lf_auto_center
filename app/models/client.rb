class Client < ApplicationRecord
  validates :name, :phone, :address, presence: true
end
