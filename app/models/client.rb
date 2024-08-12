class Client < ApplicationRecord
  validates :name, presence: true

  has_one :address, dependent: :destroy # Relacionamento com endereço, o endereço será destruído se o cliente for
  has_many :service_orders, dependent: :destroy
  has_many :vehicles, dependent: :destroy
  has_many :budgets, dependent: :destroy

  accepts_nested_attributes_for :address # Permitir atributos aninhados para o endereço
end