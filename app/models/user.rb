class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  has_many :user_events
  has_many :hosting_events, class_name: "Event", foreign_key: :hoster_id
  has_many :attending_events, through: :user_events, source: :event

  validates :username, uniqueness: true, presence: true
  validates :email_address, uniqueness: true, presence: true
  validates :password, presence: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
