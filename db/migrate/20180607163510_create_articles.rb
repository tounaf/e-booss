class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :titre
      t.text :message
      t.string :photo

      t.timestamps
    end
  end
end
