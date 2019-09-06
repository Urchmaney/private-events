# frozen_string_literal: true

require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @event = events(:one)
  end

  test 'Login page' do
    get '/login'
    assert_template 'sessions/new'
  end

  test 'Event page when logged in' do    
    log_in_as @user
    get '/events/new'
    assert_template 'events/new'
  end

  test 'Logged in user event page has past and upcomming events' do
    log_in_as @user
    get '/events'
    assert_not_nil assigns(:past)
    assert_not_nil assigns(:upcoming)
  end

  test 'Logged in user event page show events and attendees' do
    log_in_as @user
    get event_url(@event)
    assert_not_nil assigns(:event)
  end

  test 'User show page display events created by user with past and upcoming events' do
    log_in_as @user
    get user_url(@user)
    assert_not_nil assigns(:events)
    assert_not_nil assigns(:upcoming_events)
    assert_not_nil assigns(:prev_events)
  end
end
