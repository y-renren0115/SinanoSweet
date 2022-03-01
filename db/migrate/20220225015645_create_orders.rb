class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :name
      t.string :postcode
      t.string :address
      t.integer :pay_method
      t.integer :shipping_fee
      t.integer :total_billed_amount
      t.integer :order_status, default: 0, null: false
      t.timestamps
    end
  end
end
