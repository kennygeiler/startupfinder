class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :post
      t.text :content
      t.timestamps null: false
    end
  end
end
