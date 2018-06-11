class CreateAssociateNiveausupFilieres < ActiveRecord::Migration[5.2]
  def change
    create_table :associate_niveausup_filieres do |t|
      t.belongs_to :niveausup, foreign_key: true
      t.belongs_to :filiere, foreign_key: true
      t.timestamps
    end
  end
end
