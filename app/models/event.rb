class Event < ApplicationRecord
  belongs_to :hoster, class_name: "User"

  has_many :user_events
  has_many :attendees, through: :user_events, source: :user
end
