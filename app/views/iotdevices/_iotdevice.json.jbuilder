json.extract! iotdevice, :id, :manufacturer_id, :user_id, :product_url, :updates_url, :base_version, :created_at, :updated_at
json.url iotdevice_url(iotdevice, format: :json)