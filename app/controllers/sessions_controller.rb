class SessionsController < ApplicationController
	include CurrentUserConcern

	def create
		user = User.find_by(session_params)
						
		if user && user.try(:authenticate, params['user']['password'])
			session[:user_id] = user.id
			render json: {
				status: :created,
				logged_in: true,
				user: user
			}
		else
			if(user.nil?)
				render json: { error:   'User not found'}, status: 400
			else
				render json: { error:   'Unauthorized, check the credentials'}, status: 401
			end
		end
	end

	def logged_in
		if @current_user
			render json: {
				logged_in: true,
				user: @current_user
			} 
		else
			render json: {
				logged_in: false
			}
		end
	end

	def logout
		reset_session
		render json: { status: 200, logged_out: true }
	end

	private

	def session_params
		params.require(:session).permit(:email, :password)
	end

end