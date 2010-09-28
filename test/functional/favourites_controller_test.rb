require 'test_helper'

class FavouritesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favourites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favourite" do
    assert_difference('Favourite.count') do
      post :create, :favourite => { }
    end

    assert_redirected_to favourite_path(assigns(:favourite))
  end

  test "should show favourite" do
    get :show, :id => favourites(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => favourites(:one).id
    assert_response :success
  end

  test "should update favourite" do
    put :update, :id => favourites(:one).id, :favourite => { }
    assert_redirected_to favourite_path(assigns(:favourite))
  end

  test "should destroy favourite" do
    assert_difference('Favourite.count', -1) do
      delete :destroy, :id => favourites(:one).id
    end

    assert_redirected_to favourites_path
  end
end
