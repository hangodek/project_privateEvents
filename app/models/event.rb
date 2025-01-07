class Event < ApplicationRecord
  belongs_to :hoster, class_name: "User"

  has_many :user_events
  has_many :attendees, through: :user_events, source: :user

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :location, presence: true
end
