class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :sexe, :string
    add_column :users, :date_de_naissance, :datetime
    add_column :users, :adresse, :string
    add_column :users, :telephone, :string
  end
end
