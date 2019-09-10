# frozen_string_literal: true

module InvitationsHelper
  def user_already_attending?(user_id, event_id)
    event = Event.find(event_id)
    user = User.find(user_id)
    user.attended_events.include? event
  end
end
