class UsersAdd < ActiveRecord::Migration[5.1]
  def change
    def change
      create_table :users do |t|
        t.column :username, :string
        t.column :password, :string

        t.timestamps
      end
      create_join_table :comments, :users
      create_join_table :posts, :users
    end
  end
end
