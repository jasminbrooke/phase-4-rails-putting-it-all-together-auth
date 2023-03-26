class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username], password: params[:password])
        if user&.authenticate(:password_digest)
            session[:user_id] = user.id
            render json: user
        else
            render json: { error: 'Error!' }, :status :unauthorized
    end

end