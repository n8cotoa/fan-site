class CommentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.column :comment, :string

      t.timestamps
    end
    create_join_table :comments, :posts
  end
end
