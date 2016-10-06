class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.text :body
      t.string :title
      t.references :iotdevice, index: true

      t.timestamps
    end
  end
end
