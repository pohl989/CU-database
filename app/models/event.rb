class Event < ApplicationRecord

  # has_many :contact_events, inverse_of: :event
  # has_many :contacts, through: :contact_event
  # accepts_nested_attributes_for :contact_events, reject_if: :all_blank, allow_destroy: true


  has_many :attendances, inverse_of: :event
  accepts_nested_attributes_for :attendances, reject_if: :all_blank, allow_destroy: true
  has_many :contacts, through: :attendances



end
