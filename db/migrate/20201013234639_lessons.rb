class Lessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :grade
      t.string :label
      t.string :subject
      t.text :description
      t.string :image_url
      t.integer :user_id
    end
  end
end
