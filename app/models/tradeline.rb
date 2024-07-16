class Tradeline < ApplicationRecord
  has_many :deposits, dependent: :destroy
end