class UserController < ApplicationController
    
    def index
        @user = current_user
        render '/user/index'
    end
    
    #def create
    #    redirect_to user_index_path
    #end
    
    # def destroy
    #     @user = User.find(params[:id])
    #     @user.destroy
    #     @flash = 'destroy done'
    #     render 'home/home'
    # end
end
