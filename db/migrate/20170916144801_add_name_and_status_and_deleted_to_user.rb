class AddNameAndStatusAndDeletedToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :status, :boolean, default: false
    add_column :users, :deleted, :boolean, default: false
  end
end
