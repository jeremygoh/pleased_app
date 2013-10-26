class RemoveInitialTypesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :peer
    remove_column :users, :professional
  end
end
