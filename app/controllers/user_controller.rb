class UserController < ApplicationController
    
    def index
        @user = current_user
        @posts = Post.all
    end

end
