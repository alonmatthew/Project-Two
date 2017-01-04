class RemoveImgUrlFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :img_url, :string
  end
end
