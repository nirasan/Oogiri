class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :from_user_id, null:false
      t.integer :to_user_id, null:false

      t.timestamps null: false

      t.index [:from_user_id,:to_user_id], unique:true
      t.index :to_user_id
    end
  end
end
