class AddIndexesToTagTaggingsAndChoice < ActiveRecord::Migration
  def change
    add_index :tags, :name
    add_index :choices, :name
    add_index :choices, :user_id
    add_index :taggings, :tag_id
    add_index :taggings, :choice_id
  end
end
