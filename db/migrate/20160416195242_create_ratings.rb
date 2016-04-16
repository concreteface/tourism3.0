class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating, null: false
      t.belongs_to :attraction, null: false
      t.belongs_to :user
    end
  end
end
