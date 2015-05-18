class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, unique: true, null: false
      t.string :username, unique: true, null: false
      t.string :password_digest, null: false
      t.text :credentials
      t.timestamps
    end
  end
end
