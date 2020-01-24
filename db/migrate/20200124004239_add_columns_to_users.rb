class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :cpf, :string
    add_column :users, :street, :string
    add_column :users, :number, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :details, :string
    add_column :users, :status, :string
  end
end
