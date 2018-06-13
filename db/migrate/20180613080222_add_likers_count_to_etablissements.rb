class AddLikersCountToEtablissements < ActiveRecord::Migration[5.2]
  def change
    add_column :etablissements, :likers_count, :integer, :default => 0
  end
end
