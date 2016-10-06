class CreateMyIotDevices < ActiveRecord::Migration
  def change
    create_table :my_iot_devices do |t|
      t.references :iotdevice, index: true
      t.references :user, index: true
      t.string :ipv4_address
      t.string :installed_firmware_version

      t.timestamps
    end
  end
end
