class AnimalsController < ApplicationController
  
  def index	
  	animals = Animal.all

  	render json: { data: animals }, status: 200
  end	

  def create
    animal = Animal.create(animal_params)

		if animal.save
			render json: {
				status: :created,
				animal: animal
			}, status: 200
		else
			render json: { error:  animal.errors.full_messages }, status: 400
		end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :birthday, :animal_type_id, :user_id, :location)
  end
end
