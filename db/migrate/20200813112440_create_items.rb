class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :category, null: false
      t.integer :condition, null: false
      t.integer :delivery_fee, null: false
      t.integer :prefecture, null: false
      t.integer :day, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
