class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :hotel, null: false, foreign_key: true
      t.string :room_number
      t.string :room_type
      t.float :price

      t.timestamps
    end
  end
end
