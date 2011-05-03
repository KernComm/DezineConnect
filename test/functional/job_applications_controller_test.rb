require File.dirname(__FILE__) + '/../test_helper'

class JobApplicationsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:job_applications)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_job_application
    assert_difference('JobApplication.count') do
      post :create, :job_application => { }
    end

    assert_redirected_to job_application_path(assigns(:job_application))
  end

  def test_should_show_job_application
    get :show, :id => job_applications(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => job_applications(:one).id
    assert_response :success
  end

  def test_should_update_job_application
    put :update, :id => job_applications(:one).id, :job_application => { }
    assert_redirected_to job_application_path(assigns(:job_application))
  end

  def test_should_destroy_job_application
    assert_difference('JobApplication.count', -1) do
      delete :destroy, :id => job_applications(:one).id
    end

    assert_redirected_to job_applications_path
  end
end
