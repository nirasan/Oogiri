class AddSumOfRateToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :sum_of_rate, :integer
  end
end
