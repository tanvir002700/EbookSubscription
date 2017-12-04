class AddIndexToBooksUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :books_users, [:book_id, :user_id], unique: true
  end
end
