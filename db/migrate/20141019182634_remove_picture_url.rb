class RemovePictureUrl < ActiveRecord::Migration
  def change
    remove_column :choices, :picture_url
  end
end
