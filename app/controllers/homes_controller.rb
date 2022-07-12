class HomesController < ApplicationController
  def index
    #byebug
    if current_user.has_role? :admin
      @user = User.all
    end
      @posts = Post.all
  end
end
