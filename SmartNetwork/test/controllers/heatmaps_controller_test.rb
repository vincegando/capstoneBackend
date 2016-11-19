require 'test_helper'

class HeatmapsControllerTest < ActionController::TestCase
  setup do
    @heatmap = heatmaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:heatmaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create heatmap" do
    assert_difference('Heatmap.count') do
      post :create, heatmap: {  }
    end

    assert_redirected_to heatmap_path(assigns(:heatmap))
  end

  test "should show heatmap" do
    get :show, id: @heatmap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @heatmap
    assert_response :success
  end

  test "should update heatmap" do
    patch :update, id: @heatmap, heatmap: {  }
    assert_redirected_to heatmap_path(assigns(:heatmap))
  end

  test "should destroy heatmap" do
    assert_difference('Heatmap.count', -1) do
      delete :destroy, id: @heatmap
    end

    assert_redirected_to heatmaps_path
  end
end
