class Event < ApplicationRecord
  validates :event_type, presence: true
  validates :payload, presence: true
  belongs_to :user
end
