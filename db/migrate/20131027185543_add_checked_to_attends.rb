class AddCheckedToAttends < ActiveRecord::Migration
  def change
    add_column :attends, :checked, :boolean
  end
end
