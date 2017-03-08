class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    respond do |fotmat|
      if @post.liked_by(current_user)
        format.js
        format.html {redirect_to root_url}
      end
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])
    respond do |fotmat|
      if @like.destroy
        format.js
        format.html {redirect_to root_url}
      end
    end
  end
end
