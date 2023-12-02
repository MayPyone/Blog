class AddForeignKeyToComments < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :comments, :posts, on_delete: :cascade, name: 'fk_rails_comments_posts_cascade'
  end
end
