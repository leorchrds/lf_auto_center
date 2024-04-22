class Budget < ApplicationRecord
  belongs_to :client
  has_many :budget_line_items
end
