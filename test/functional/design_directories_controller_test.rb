require 'test_helper'

class DesignDirectoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:design_directories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create design_directory" do
    assert_difference('DesignDirectory.count') do
      post :create, :design_directory => { }
    end

    assert_redirected_to design_directory_path(assigns(:design_directory))
  end

  test "should show design_directory" do
    get :show, :id => design_directories(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => design_directories(:one).id
    assert_response :success
  end

  test "should update design_directory" do
    put :update, :id => design_directories(:one).id, :design_directory => { }
    assert_redirected_to design_directory_path(assigns(:design_directory))
  end

  test "should destroy design_directory" do
    assert_difference('DesignDirectory.count', -1) do
      delete :destroy, :id => design_directories(:one).id
    end

    assert_redirected_to design_directories_path
  end
end
