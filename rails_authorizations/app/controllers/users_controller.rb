class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            @user.errors.full_messages, status: 422
        end
    end

    def new
    end


    private
        params.require(:user).permit(:username, :password)

end