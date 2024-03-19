class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.date :check_in_date
      t.date :check_out_date

      t.timestamps
    end
  end
end
