class AnimalTypesController < ApplicationController
  def create
    animal_type = AnimalType.create(
			animal_kind: params['animal_type']['animal_kind'],
		)

		if animal_type.save
			render json: {
				status: :created,
				animal_type: animal_type
			}, status: 200
		else
			render json: { error:  animal_type.errors.full_messages }, status: 400
		end
  end
  
end
