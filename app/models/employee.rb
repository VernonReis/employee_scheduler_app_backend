class Employee < ApplicationRecord
  belongs_to :employer
  has_many :schedule_entries
end
