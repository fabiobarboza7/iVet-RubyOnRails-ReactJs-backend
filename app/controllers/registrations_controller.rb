class RegistrationsController < ApplicationController
	def create
		user = User.create(
			email: params['user']['email'],
			password: params['user']['password'],
			password_confirmation: params['user']['password'],
		)

		if user.save
			session[:user_id] = user.id	
			render json: {
				status: :created,
				user: user
			}
		else
			render json: { error:  user.errors.full_messages }, status: 400
		end
	end
end