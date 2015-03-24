class ChangeDetailInQuestions < ActiveRecord::Migration
  def change
    change_column_null :questions, :detail, :false
  end
end
