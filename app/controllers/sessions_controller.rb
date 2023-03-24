class SessionsController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        if user
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {error: "Not authorized"}, status: :unathorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end
end
