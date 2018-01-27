class PayPeriod < ApplicationRecord
  has_many :schedule_entries
  belongs_to :employer
end
