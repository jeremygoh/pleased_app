class AddGroupidToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :meetings, :string
    add_reference :meetings, :group, index: true
  end
end
