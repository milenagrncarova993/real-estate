class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :size
      t.integer :year
      t.integer :rooms
      t.integer :price
      t.string :type
      t.string :state
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
