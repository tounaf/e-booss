class CreateFilieres < ActiveRecord::Migration[5.2]
  def change
    create_table :filieres do |t|
      t.string :nom
      t.text :description

      t.timestamps
    end
  end
end
