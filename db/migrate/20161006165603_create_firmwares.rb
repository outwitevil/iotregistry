class CreateFirmwares < ActiveRecord::Migration
  def change
    create_table :firmwares do |t|
      t.references :iotdevice, index: true
      t.string :download_url
      t.string :version
      t.string :name
      t.string :readme_url
      t.string :readme_title
      t.text :readme_description
      t.boolean :enabled
      t.string :requirements

      t.timestamps
    end
  end
end
