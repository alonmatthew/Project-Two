class AddAttachmentUserPostToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :user_post
    end
  end

  def self.down
    remove_attachment :images, :user_post
  end
end
