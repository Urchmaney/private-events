class EventAttendance < ApplicationRecord
    belongs_to :event_attendees, class_name: 'User'
    belongs_to :attendee_events, class_name: 'Event'
end
