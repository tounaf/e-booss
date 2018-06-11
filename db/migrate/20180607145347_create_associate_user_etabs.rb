class CreateAssociateUserEtabs < ActiveRecord::Migration[5.2]
  def change
    create_table :associate_user_etabs do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :etablissement, foreign_key: true
      
      t.timestamps
    end
  end
end
