class ChangeCommentTypeToTextFromString < ActiveRecord::Migration
  def change
    change_column :comments, :comment, :text, :limit => nil
  end
end
