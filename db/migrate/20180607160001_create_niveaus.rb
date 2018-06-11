class CreateNiveaus < ActiveRecord::Migration[5.2]
  def change
    create_table :niveaus do |t|
      t.string :niveau
      t.integer :place

      t.timestamps
    end
  end
end
