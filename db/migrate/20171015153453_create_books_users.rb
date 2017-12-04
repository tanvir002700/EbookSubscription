class CreateBooksUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :books_users do |t|
      t.belongs_to :book, index: true
      t.belongs_to :user, index: true
    end
  end
end
