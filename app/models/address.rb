class Address < ApplicationRecord
  belongs_to :client
  validates :street, :number, :complement, :neighborhood, :city, :state, :postal_code, :country, :client, presence: true
end
