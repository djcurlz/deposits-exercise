class Deposit < ApplicationRecord
  belongs_to :tradeline
  validates :date, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
