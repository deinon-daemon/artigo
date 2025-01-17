  class AddAttachmentColumnsToPhotos < ActiveRecord::Migration[5.0]
    def up
       add_column :photos, :aimage_file_name, :string
       add_column :photos, :image_file_size, :integer
       add_column :photos, :image_content_type, :string
       add_column :photos, :image_updated_at, :datetime
    end

    def down
       remove_column :photos, :image_file_name, :string
       remove_column :photos, :image_file_size, :integer
       remove_column :photos, :image_content_type, :string
       remove_column :photos, :image_updated_at, :datetime
    end
  end
