json.extract! my_iot_device, :id, :iotdevice_id, :user_id, :ipv4_address, :installed_firmware_version, :created_at, :updated_at
json.url my_iot_device_url(my_iot_device, format: :json)