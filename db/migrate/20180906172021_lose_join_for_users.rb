class LoseJoinForUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.column :username, :string
      t.column :password, :string

      t.timestamps
    end
    add_column :posts, :user_id, :integer
    add_column :comments, :user_id, :integer   
  end
end
