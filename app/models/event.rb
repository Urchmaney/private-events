class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendances, foreign_key: :attendee_event_id
  has_many :attendee, through: :event_attendances, source: :event_attendee
  has_many :invitations, foreign_key: :invitation_event_id
  has_many :invitees, through: :invitations, source: :invitation_user
  validates :description, presence: true
  validates :date, presence: true
  scope :past, -> { where('date <= ?', Time.now) }
  scope :upcoming, -> { where('date > ?', Time.now) }
end
