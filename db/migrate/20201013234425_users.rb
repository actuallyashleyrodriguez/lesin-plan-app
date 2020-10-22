class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :state
      t.string :password_digest
    end
  end
end
