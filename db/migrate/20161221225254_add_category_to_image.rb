class AddCategoryToImage < ActiveRecord::Migration
  def change
    add_column :images, :category, :string
  end
end
