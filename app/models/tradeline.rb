class Tradeline < ApplicationRecord
  has_many :deposits, dependent: :destroy

  def outstanding_balance
    amount - deposits.sum(:amount)
  end
end