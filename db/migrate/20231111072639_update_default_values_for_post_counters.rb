class UpdateDefaultValuesForPostCounters < ActiveRecord::Migration[7.1]
  def change
    change_column_default :posts, :comment_counter, from: nil, to: 0
    change_column_default :posts, :like_counter, from: nil, to: 0
  end
end
