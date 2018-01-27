class ScheduleEntry < ApplicationRecord
  belongs_to :employee
  belongs_to :employer
  belongs_to :pay_period
end
