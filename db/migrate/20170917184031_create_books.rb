class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.string :image
      t.boolean :status, default: false
      t.boolean :deleted, default: false
      t.string :author

      t.timestamps
    end
  end
end
