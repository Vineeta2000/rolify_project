class PostsController < ApplicationController
  def index
    #@post = Post.all
  end

  def new
    @post = Post.new
  end
  def create
    @post = current_user.posts.new(caption: params[:post][:caption])
    @post.save
    redirect_to root_path

  end
  

  def show
    #byebug
    @post = Post.find(params[:id])
    @comments = @post.comments

  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
     @post = Post.find(params[:id])
     @post.update(caption: params[:post][:caption])
     redirect_to root_path
  end

  def destroy
    #byebug
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def create_comment
    #byebug
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(feedback: params[:feedback], user_id: current_user.id)
    @comment.save
    @comments = @post.comments
  end
  
   def destroy_comment
    #byebug
     @comment = Comment.find(params[:comment_id])
     @comment.destroy
     @comments =  @comment.post.comments
   end

 def like_dislike
  byebug
  @comment = Comment.find(params[:comment_id])
  @like = @comment.likes.new(user_id: current_user.id)
  @like.save

end

end
