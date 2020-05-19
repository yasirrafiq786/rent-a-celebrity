class ChangeRatingToBeFloatInReviews < ActiveRecord::Migration[6.0]
  def self.up
    change_column :reviews, :rating, :float
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
