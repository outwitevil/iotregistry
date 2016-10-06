require 'test_helper'

class IotdevicesControllerTest < ActionController::TestCase
  setup do
    @iotdevice = iotdevices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iotdevices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iotdevice" do
    assert_difference('Iotdevice.count') do
      post :create, iotdevice: { base_version: @iotdevice.base_version, manufacturer_id: @iotdevice.manufacturer_id, product_url: @iotdevice.product_url, updates_url: @iotdevice.updates_url, user_id: @iotdevice.user_id }
    end

    assert_redirected_to iotdevice_path(assigns(:iotdevice))
  end

  test "should show iotdevice" do
    get :show, id: @iotdevice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iotdevice
    assert_response :success
  end

  test "should update iotdevice" do
    patch :update, id: @iotdevice, iotdevice: { base_version: @iotdevice.base_version, manufacturer_id: @iotdevice.manufacturer_id, product_url: @iotdevice.product_url, updates_url: @iotdevice.updates_url, user_id: @iotdevice.user_id }
    assert_redirected_to iotdevice_path(assigns(:iotdevice))
  end

  test "should destroy iotdevice" do
    assert_difference('Iotdevice.count', -1) do
      delete :destroy, id: @iotdevice
    end

    assert_redirected_to iotdevices_path
  end
end
