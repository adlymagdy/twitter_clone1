require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:adly)
  end
  
  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template "users/edit"
    patch user_path(@user), user: {name: "", email: "asas", password: "foo", password_confirmation: "foobar"}
    assert_template "users/edit"
  end
  
  test "successful edit" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    patch user_path(@user), user: {name: "foobar", email: "foo@bar.com", password: "", password_confirmation: ""}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name, "foobar"
    assert_equal @user.email, "foo@bar.com"
  end
end
