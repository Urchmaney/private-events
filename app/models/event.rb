class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendances, foreign_key: :event_attendee_id
  has_many :attendees, through: :event_attendances, source: :event_attendees
  validates :description, presence: true
  validates :date, presence: true
  scope :prev_events, -> { where('date <= ?', Time.now) }
  scope :upcoming_events, -> { where('date > ?', Time.now) }
end
