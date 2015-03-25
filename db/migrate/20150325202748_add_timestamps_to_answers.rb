class AddTimestampsToAnswers < ActiveRecord::Migration
  def change
    change_table(:answers) { |t| t.timestamps }
  end
end
