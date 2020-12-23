class SeedCommentsAndReplies < ActiveRecord::Migration[6.0]
  def change
      @post = Post.create :topic_id => 1, :title => "Афигительный пост о разработке", :body => "Очень полезный пост"
      @comment1 = Comment.create :post_id => @post.id, :parent_id => 0, :body => "Круто!"
      @reply1 = Comment.create :post_id => @post.id, :parent_id => @comment1.id, :body => "+1"
      @reply1 = Comment.create :post_id => @post.id, :parent_id => @comment1.id, :body => "Спасибо)"

      @comment2 = Comment.create :post_id => @post.id, :parent_id => 0, :body => "Спасибо, все круто!"
      @reply3 = Comment.create :post_id => @post.id, :parent_id => @comment2.id, :body => "Автор молодец"

  end
end