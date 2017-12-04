class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :cover_photo
      t.string :pdf

      t.timestamps
    end
  end
end
