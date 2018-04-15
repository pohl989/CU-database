class Attendance < ApplicationRecord

  belongs_to :contact
  belongs_to :event

end
