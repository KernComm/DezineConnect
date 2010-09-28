require File.dirname(__FILE__) + '/../test_helper'

class JobPostingsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:job_postings)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_job_posting
    assert_difference('JobPosting.count') do
      post :create, :job_posting => { }
    end

    assert_redirected_to job_posting_path(assigns(:job_posting))
  end

  def test_should_show_job_posting
    get :show, :id => job_postings(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => job_postings(:one).id
    assert_response :success
  end

  def test_should_update_job_posting
    put :update, :id => job_postings(:one).id, :job_posting => { }
    assert_redirected_to job_posting_path(assigns(:job_posting))
  end

  def test_should_destroy_job_posting
    assert_difference('JobPosting.count', -1) do
      delete :destroy, :id => job_postings(:one).id
    end

    assert_redirected_to job_postings_path
  end
end
