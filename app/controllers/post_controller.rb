class PostController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, only: [:new, :create, :destroy]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_parameters)
    if(@post.save)
      flash[:notice] = "新規投稿しました"
      redirect_to root_path
    else
      flash[:alert] = @post.errors.full_messages
      redirect_to new_user_post_path
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to root_path
  end
  
  private
    def post_parameters
      params.require(:post).permit(:content).merge(user_id: current_user.id)
    end
    
    def correct_user?
      if current_user.id.to_s != params[:user_id]
        flash[:alert]= "正しいユーザでログインしてください"
        redirect_to root_path
      end
    end
end
