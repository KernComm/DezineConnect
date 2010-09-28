require 'test_helper'

class CompanyImagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_images" do
    assert_difference('CompanyImages.count') do
      post :create, :company_images => { }
    end

    assert_redirected_to company_images_path(assigns(:company_images))
  end

  test "should show company_images" do
    get :show, :id => company_images(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => company_images(:one).id
    assert_response :success
  end

  test "should update company_images" do
    put :update, :id => company_images(:one).id, :company_images => { }
    assert_redirected_to company_images_path(assigns(:company_images))
  end

  test "should destroy company_images" do
    assert_difference('CompanyImages.count', -1) do
      delete :destroy, :id => company_images(:one).id
    end

    assert_redirected_to company_images_path
  end
end
