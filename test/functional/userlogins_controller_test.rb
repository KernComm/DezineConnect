require File.dirname(__FILE__) + '/../test_helper'

class UserloginsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:userlogins)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_userlogin
    assert_difference('Userlogin.count') do
      post :create, :userlogin => { }
    end

    assert_redirected_to userlogin_path(assigns(:userlogin))
  end

  def test_should_show_userlogin
    get :show, :id => userlogins(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => userlogins(:one).id
    assert_response :success
  end

  def test_should_update_userlogin
    put :update, :id => userlogins(:one).id, :userlogin => { }
    assert_redirected_to userlogin_path(assigns(:userlogin))
  end

  def test_should_destroy_userlogin
    assert_difference('Userlogin.count', -1) do
      delete :destroy, :id => userlogins(:one).id
    end

    assert_redirected_to userlogins_path
  end
end
