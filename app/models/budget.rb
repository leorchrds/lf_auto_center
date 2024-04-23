class Budget < ApplicationRecord
  belongs_to :client
  has_many :budget_line_items
  accepts_nested_attributes_for :budget_line_items
end
