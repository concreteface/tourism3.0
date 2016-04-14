class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :user
      t.belongs_to :attraction
    end
  end
end
