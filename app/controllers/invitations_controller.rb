# frozen_string_literal: true

class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      flash[:success] = 'Successfully sent invitation'
      redirect_to current_user
    else
      flash[:danger] = 'Please select valid input from drop down'
      render :new
    end
  end

  def index
    @invitation = current_user.event_invitations        
  end

  def accept
    @attance= EventAttendance.new(event_attendee_id: current_user.id,attendee_event_id: params[:event][:id])
    if @attance.save
        flash[:success] = 'Successfully accepted invitation'
    else
        flash[:danger] = 'Issues accepting invitation'
    end
    redirect_to :action => 'index'
  end

  private

  def invitation_params
    params.require(:invitation).permit(:invitation_event_id, :invitation_user_id)
  end    
end
