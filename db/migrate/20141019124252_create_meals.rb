class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :user_id
      t.integer :choice_id
      t.string :occasion

      t.timestamps
    end
  end
end
