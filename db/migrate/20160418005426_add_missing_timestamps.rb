class AddMissingTimestamps < ActiveRecord::Migration
  def change
    add_timestamps :attractions
    add_timestamps :visits
    add_timestamps :comments
    add_timestamps :ratings
  end
end
