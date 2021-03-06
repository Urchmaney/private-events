# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  before_save { email.downcase! }
  before_save { username.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_many :events, foreign_key: 'creator_id'
  has_many :event_attendances, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendances, source: :attendee_event
  has_many :invitations, foreign_key: :invitation_user_id
  has_many :event_invitations, through: :invitations, source: :invitation_event
  scope :all_except_user, ->(user) { where('id != ?', user.id) }
  scope :exlude_users, ->(user_array) { except(user_array) }
end
