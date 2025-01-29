class AddAttachmentImageToPhotos < ActiveRecord::Migration[5.0]
  # This migration uses deprecated args for this gem now that we are on rails 3.3.1, so skip for now
  # TO DO:
  # def self.up
  #   change_table :photos do |t|
  #     t.attachment :image
  #   end
  # end
  #
  # def change
  #   add_attachment :photos, :image
  # end

  # def self.down
  #   remove_attachment :photos, :image
  # end
end
