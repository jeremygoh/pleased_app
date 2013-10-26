class AddPeerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :peer, :boolean
  end
end
