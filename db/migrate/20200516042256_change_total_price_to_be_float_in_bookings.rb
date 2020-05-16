class ChangeTotalPriceToBeFloatInBookings < ActiveRecord::Migration[6.0]
  def self.up
    change_column :bookings, :total_price, :float
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
