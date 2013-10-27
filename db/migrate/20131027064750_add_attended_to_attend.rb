class AddAttendedToAttend < ActiveRecord::Migration
  def change
    add_column :attends, :attended, :boolean
  end
end
