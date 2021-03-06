class AddAttachmentImageToUsers < ActiveRecord::Migration[6.0]
  def self.up
    change_table :users do |t|
      t.attachment :image, null: true
    end
  end

  def self.down
    remove_attachment :users, :image
  end
end
