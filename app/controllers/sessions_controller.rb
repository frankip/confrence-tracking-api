class SessionsController < ApplicationController

    skip_before_action :authenticate, only: [:create, :google]
    
    def create
        user = User.find_by(email: session_params[:email])
        if user&.authenticate(session_params[:password])
            # Generate a session token
            token = encode_token({ email: user.email })

            # Set the session token as an HTTP-only cookie
            cookies.signed[:session_token] = {
                value: token,
                httponly: true,
                secure: Rails.env.production?, # Set secure flag for production environment
                expires: 1.hour.from_now # Set cookie expiration time
            }

            render json: user, status: :accepted
        else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end

    def me
        render json: @user
    end

    # # check and create google user
    # def google_user
    #     user = User.find_by(email: params[:email])
    #     if user
    #     token = encode_token({user_id: user.id})
    #     render json: { loggedin: true, user: user, jwt: token, status: 'loggedin' }
    #     else
    #     # Create a new user with the provided email and name
    #     new_user = User.create(email: params[:email], name: params[:name], password: 'swr23r3r3r334gdvrv', password_confirmation: 'swr23r3r3r334gdvrv')
    #     token = encode_token({user_id: new_user.id})
    #     render json: { loggedin: true, user: new_user, jwt:token, status:'registered' }
    #     end
    # end
 
    # clear JWT token from client's storage
    def destroy
        cookies.delete(:jwt)
        render json: { message: 'Logged out successfully' }
    end

    private

    def session_params
        params.permit(:email, :password)
    end 
end