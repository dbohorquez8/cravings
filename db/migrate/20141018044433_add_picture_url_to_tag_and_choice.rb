class AddPictureUrlToTagAndChoice < ActiveRecord::Migration
  def change
    add_column :tags, :picture_url, :string
    add_column :choices, :picture_url, :string
  end
end
