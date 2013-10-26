class AddGroupidToPatient < ActiveRecord::Migration
  def change
  	add_column :patients, :group_id, :integer
  end
end
