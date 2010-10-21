require 'test_helper'

class JobPostingDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_posting_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_posting_detail" do
    assert_difference('JobPostingDetail.count') do
      post :create, :job_posting_detail => { }
    end

    assert_redirected_to job_posting_detail_path(assigns(:job_posting_detail))
  end

  test "should show job_posting_detail" do
    get :show, :id => job_posting_details(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => job_posting_details(:one).id
    assert_response :success
  end

  test "should update job_posting_detail" do
    put :update, :id => job_posting_details(:one).id, :job_posting_detail => { }
    assert_redirected_to job_posting_detail_path(assigns(:job_posting_detail))
  end

  test "should destroy job_posting_detail" do
    assert_difference('JobPostingDetail.count', -1) do
      delete :destroy, :id => job_posting_details(:one).id
    end

    assert_redirected_to job_posting_details_path
  end
end
