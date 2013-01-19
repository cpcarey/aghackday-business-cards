require 'test_helper'

class InfosControllerTest < ActionController::TestCase
  setup do
    @info = infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create info" do
    assert_difference('Info.count') do
      post :create, :info => { :address => @info.address, :email => @info.email, :first_name => @info.first_name, :job_title => @info.job_title, :last_name => @info.last_name, :logo_url => @info.logo_url, :organization => @info.organization, :phone_number => @info.phone_number, :website => @info.website }
    end

    assert_redirected_to info_path(assigns(:info))
  end

  test "should show info" do
    get :show, :id => @info
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @info
    assert_response :success
  end

  test "should update info" do
    put :update, :id => @info, :info => { :address => @info.address, :email => @info.email, :first_name => @info.first_name, :job_title => @info.job_title, :last_name => @info.last_name, :logo_url => @info.logo_url, :organization => @info.organization, :phone_number => @info.phone_number, :website => @info.website }
    assert_redirected_to info_path(assigns(:info))
  end

  test "should destroy info" do
    assert_difference('Info.count', -1) do
      delete :destroy, :id => @info
    end

    assert_redirected_to infos_path
  end
end
