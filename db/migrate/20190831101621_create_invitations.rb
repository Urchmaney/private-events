class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :invitation_event_id
      t.integer :invitation_user_id
      t.timestamps
    end
  end
end
