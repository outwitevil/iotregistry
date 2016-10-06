class CreateDeviceCategories < ActiveRecord::Migration
  def change
    create_table :device_categories do |t|
      t.string :name
      t.references :iotdevice, index: true

      t.timestamps
    end
  end
end
