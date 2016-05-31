class ChangeUserTable < ActiveRecord::Migration
  def change
    remove_column :users, :email
    remove_column :users, :name
    add_column :users, :username, :string, null: false, unique: true, default: ""
  end
end
