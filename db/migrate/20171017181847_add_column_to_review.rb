class AddColumnToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :previous_status, :integer
  end
end
