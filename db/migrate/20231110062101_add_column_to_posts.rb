class AddColumnToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :title, :string
    add_column :posts, :text, :string
    add_column :posts, :comment_counter, :integer, default: 0
    add_column :posts, :like_counter, :integer, default: 0
  end
end
