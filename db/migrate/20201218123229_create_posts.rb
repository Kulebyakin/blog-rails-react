class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :id
      t.string :title
      t.string :body
      t.integer :created_by
      t.integer :topic_id

      t.timestamps
    end
  end
end
