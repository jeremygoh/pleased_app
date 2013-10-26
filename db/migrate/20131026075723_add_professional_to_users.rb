class AddProfessionalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :professional, :boolean
  end
end
