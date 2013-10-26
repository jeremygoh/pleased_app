class CreateAttends < ActiveRecord::Migration
  def change
    create_table :attends do |t|
	  t.references :meeting, index: true
	  t.references :patient, index: true
    end
  end
end
