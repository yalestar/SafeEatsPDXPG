class RestaurantsController < ApplicationController

	private
	  # Using a private method to encapsulate the permissible parameters is a good pattern
	  # since you'll be able to reuse the same permit list between create and update. Also, you
	  # can specialize this method with per-user checking of permissible attributes.
	  def person_params
	    params.require(:person).permit(:name, :age)
	  end
end
