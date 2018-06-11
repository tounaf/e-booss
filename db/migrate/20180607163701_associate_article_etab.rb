class AssociateArticleEtab < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :etablissement, foreign_key: true
  end
end
