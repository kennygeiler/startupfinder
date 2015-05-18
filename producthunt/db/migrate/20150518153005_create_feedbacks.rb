class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :question
      t.references :post
      t.timestamps null: false
    end
  end
end
