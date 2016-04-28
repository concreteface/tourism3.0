class DropRatingsTable < ActiveRecord::Migration
  def up
    drop_table :ratings
  end

  def down
    create_table :ratings do |t|
      t.integer :rating, null: false
      t.belongs_to :attraction, null: false
      t.belongs_to :user
    end
  end
end
