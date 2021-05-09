class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :postal_code,     null: false
      t.integer :shippingarea,   null: false
      t.string :municipalities,  null: false
      t.string :adress,          null: false
      t.string :buildingname    
      t.string :phonenumber,     null: false
      t.references :record,      null: false
      t.timestamps

    end
  end
end
