require 'test_helper'
class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'Login page' do
    get '/login'
    assert_template 'sessions/new'
  end

  test 'Event page when logged in' do
    get login_path
    log_in_as nil
    assert is_logged_in?
    get '/events/new'
    assert_template layout: 'events/new'
  end
end
