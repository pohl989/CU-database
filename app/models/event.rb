class Event < ApplicationRecord

  has_one :contact_event
  has_many :contacts, through: :contact_event

end
