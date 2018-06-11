class AddAttachmentImageEtablissementToEtablissements < ActiveRecord::Migration[5.2]
  def self.up
    change_table :etablissements do |t|
      t.attachment :image_etablissement
    end
  end

  def self.down
    remove_attachment :etablissements, :image_etablissement
  end
end
