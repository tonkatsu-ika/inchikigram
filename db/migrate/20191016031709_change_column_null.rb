class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :posts, :created_at, true
    change_column_null :posts, :updated_at, true
  end
end
