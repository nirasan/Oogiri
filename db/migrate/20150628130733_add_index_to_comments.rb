class AddIndexToComments < ActiveRecord::Migration
  def change
    add_index :comments, [:user_id,:answer_id], unique:true
    remove_index :comments, :user_id
  end
end
