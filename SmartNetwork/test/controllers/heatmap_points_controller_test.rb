require 'test_helper'

class HeatmapPointsControllerTest < ActionController::TestCase
  setup do
    @heatmap_point = heatmap_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:heatmap_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create heatmap_point" do
    assert_difference('HeatmapPoint.count') do
      post :create, heatmap_point: {  }
    end

    assert_redirected_to heatmap_point_path(assigns(:heatmap_point))
  end

  test "should show heatmap_point" do
    get :show, id: @heatmap_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @heatmap_point
    assert_response :success
  end

  test "should update heatmap_point" do
    patch :update, id: @heatmap_point, heatmap_point: {  }
    assert_redirected_to heatmap_point_path(assigns(:heatmap_point))
  end

  test "should destroy heatmap_point" do
    assert_difference('HeatmapPoint.count', -1) do
      delete :destroy, id: @heatmap_point
    end

    assert_redirected_to heatmap_points_path
  end
end
