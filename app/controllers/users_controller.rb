class UsersController < ApplicationController

  def profile
    @movement = current_user.movements.last
    # @meal = current_user.meals.last
  end

end
