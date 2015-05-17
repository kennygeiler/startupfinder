class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|

      t.timestamps null: false
    end
  end
end
