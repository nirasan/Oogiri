class CreateUserRankings < ActiveRecord::Migration
  def change
    create_table :user_rankings do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :rank
      t.integer :rate

      t.timestamps null: false
    end
  end
end
