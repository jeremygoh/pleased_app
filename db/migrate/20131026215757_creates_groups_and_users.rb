class CreatesGroupsAndUsers < ActiveRecord::Migration
  def change
    create_table :groups_users do |t|
      t.belongs_to :group
      t.belongs_to :user
    end
  end
end
