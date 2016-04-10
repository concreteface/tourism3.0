class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name, null: false
      t.float :latitude
      t.float :longitude
      t.integer :creator_id, null: false
      t.string :photo
      t.string :description
    end
  end
end
