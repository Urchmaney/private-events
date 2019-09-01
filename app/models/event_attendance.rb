# frozen_string_literal: true

class EventAttendance < ApplicationRecord
  belongs_to :event_attendee, class_name: 'User'
  belongs_to :attendee_event, class_name: 'Event'
end
