class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :zip_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.text :address, null: false
      t.string :building
      t.string :tel, null: false
      t.references :buy, foreign_key: true
      t.timestamps
    end
  end
end
