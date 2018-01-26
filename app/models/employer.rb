class Employer < ApplicationRecord
  has_many :users
  has_many :employees
  has_many :schedule_entries
end
