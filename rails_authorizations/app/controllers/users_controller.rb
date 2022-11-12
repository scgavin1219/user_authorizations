class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            render :show
        else
            @user.errors.full_messages, status: 422
        end
    end

    def new
    end

    def show
    end


    private
        params.require(:user).permit(:username, :password)

end