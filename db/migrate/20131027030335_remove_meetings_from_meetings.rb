class RemoveMeetingsFromMeetings < ActiveRecord::Migration
  def change
    remove_column :meetings, :meetings
  end
end
