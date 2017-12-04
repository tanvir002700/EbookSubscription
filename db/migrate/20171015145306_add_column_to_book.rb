class AddColumnToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :status, :integer, default: 0
  end
end
