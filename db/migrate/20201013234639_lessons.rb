class Lessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :grade
      t.string :subject
      t.text :description
      t.string :image_url
    end
  end
end
