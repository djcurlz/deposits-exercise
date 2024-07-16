class Deposit < ApplicationRecord
  belongs_to :tradeline
  validates :date, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validate :amount_cannot_exceed_outstanding_balance

  private

  def amount_cannot_exceed_outstanding_balance
    if amount > tradeline.outstanding_balance
      errors.add(:amount, "deposit amount cannot exceed outstanding balance of a tradeline")
    end
  end
end
