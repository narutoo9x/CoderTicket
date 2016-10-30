class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.datetime :confirm_at
      t.string :discount_code

      t.timestamps
    end
  end
end
