class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.references :answer, index: true, foreign_key: true
      t.integer :rank
      t.integer :rate

      t.timestamps null: false
    end
  end
end
