class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        unless Profile.exists?(user_id: @user.id)
            if current_user.id == @user.id
                redirect_to new_user_profile_path(current_user.id)
            else
                flash[:notice] = "No profile found"
                redirect_to root_path
            end
        end
    end
    
    def index
    end
end