# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :invitation_event, class_name: 'Event'
  belongs_to :invitation_user, class_name: 'User'
end
