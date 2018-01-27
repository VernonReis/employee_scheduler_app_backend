class Employer < ApplicationRecord
  has_many :users
  has_many :employees
  has_many :schedule_entries
  has_many :pay_periods
end
