class CreateEtablissements < ActiveRecord::Migration[5.2]
  def change
    create_table :etablissements do |t|
      t.string :nom
      t.string :mail
      t.string :telephone
      t.string :adress
      t.text :description
      t.string :category
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
