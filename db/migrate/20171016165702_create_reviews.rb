class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :book, index: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
