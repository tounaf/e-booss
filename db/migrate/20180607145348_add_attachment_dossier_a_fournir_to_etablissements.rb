class AddAttachmentDossierAFournirToEtablissements < ActiveRecord::Migration[5.2]
  def self.up
    change_table :etablissements do |t|
      t.attachment :dossier_a_fournir
    end
  end

  def self.down
    remove_attachment :etablissements, :dossier_a_fournir
  end
end
