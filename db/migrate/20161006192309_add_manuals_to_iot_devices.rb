class AddManualsToIotDevices < ActiveRecord::Migration[5.0]
  def change
    add_column :iotdevices, :manual_url, :string
    add_column :iotdevices, :manual_title, :string
    add_column :iotdevices, :manual_file_type, :string
  end
end
