class CreateNiveausups < ActiveRecord::Migration[5.2]
  def change
    create_table :niveausups do |t|
      t.string :niveau
      t.integer :nb_place

      t.timestamps
    end
  end
end
