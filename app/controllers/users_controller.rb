class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.admin = false
        if @user.save
            session[:user_id] = @user.id
            redirect_to tasks_path
        else
            flash.now[:alert] = "Invalid signup"
            render :new,  status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.expect(user: %i[email first_name last_name username password])
    end
end