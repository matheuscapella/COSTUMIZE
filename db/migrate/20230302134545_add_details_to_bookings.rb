class AddDetailsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :user, index: true
    add_reference :bookings, :costume, index: true
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
  end
end
