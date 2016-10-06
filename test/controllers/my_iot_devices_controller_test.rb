require 'test_helper'

class MyIotDevicesControllerTest < ActionController::TestCase
  setup do
    @my_iot_device = my_iot_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_iot_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_iot_device" do
    assert_difference('MyIotDevice.count') do
      post :create, my_iot_device: { installed_firmware_version: @my_iot_device.installed_firmware_version, iotdevice_id: @my_iot_device.iotdevice_id, ipv4_address: @my_iot_device.ipv4_address, user_id: @my_iot_device.user_id }
    end

    assert_redirected_to my_iot_device_path(assigns(:my_iot_device))
  end

  test "should show my_iot_device" do
    get :show, id: @my_iot_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_iot_device
    assert_response :success
  end

  test "should update my_iot_device" do
    patch :update, id: @my_iot_device, my_iot_device: { installed_firmware_version: @my_iot_device.installed_firmware_version, iotdevice_id: @my_iot_device.iotdevice_id, ipv4_address: @my_iot_device.ipv4_address, user_id: @my_iot_device.user_id }
    assert_redirected_to my_iot_device_path(assigns(:my_iot_device))
  end

  test "should destroy my_iot_device" do
    assert_difference('MyIotDevice.count', -1) do
      delete :destroy, id: @my_iot_device
    end

    assert_redirected_to my_iot_devices_path
  end
end
