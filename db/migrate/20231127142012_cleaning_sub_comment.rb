class CleaningSubComment < ActiveRecord::Migration[7.1]
  def change
    remove_column :sub_comments, :comment_id
    remove_column :sub_comments, :content
    remove_column :sub_comments, :user_id
    add_reference :sub_comments, :user
    add_reference :sub_comments, :comment
    add_column :sub_comments, :content, :text
  end
end
