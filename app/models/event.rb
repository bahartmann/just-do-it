class Event < ApplicationRecord
  validates :event_type, presence: true
  validates :payload, presence: true
end
