class Contact < ApplicationRecord

  has_one :user
  has_one :contact_event
  has_many :events, through: :contact_event
  has_one :client

end
