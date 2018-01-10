class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :pv, default: 0
      t.string :thum
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
