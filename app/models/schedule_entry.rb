class ScheduleEntry < ApplicationRecord
  belongs_to :employee
  belongs_to :employer
end
