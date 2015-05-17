class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|

      t.timestamps null: false
    end
  end
end
