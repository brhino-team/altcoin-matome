class AddThumToArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :thun, :string
    add_column :articles, :thum, :string
  end
end
