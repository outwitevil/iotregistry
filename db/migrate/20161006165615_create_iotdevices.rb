class CreateIotdevices < ActiveRecord::Migration
  def change
    create_table :iotdevices do |t|
      t.references :manufacturer, index: true
      t.references :user, index: true
      t.string :product_url
      t.string :updates_url
      t.string :base_version

      t.timestamps
    end
  end
end
