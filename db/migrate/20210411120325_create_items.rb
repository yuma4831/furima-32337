class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,              null: false
      t.integer :price,            null: false
      t.text :content,              null: false
      t.integer :category_id,      null: false
      t.integer :condition_id,     null: false
      t.integer :shippingfee_id,  null: false
      t.integer :shippingarea_id, null: false
      t.integer :shippingtime_id, null: false
      t.references :user,          foreign_key: true
      t.timestamps
    end
  end
end
