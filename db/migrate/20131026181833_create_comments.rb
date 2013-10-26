class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.datetime :date
      t.references :meeting, index: true
      t.references :user, index: true
      t.references :patient, index: true

      t.timestamps
    end
  end
end
