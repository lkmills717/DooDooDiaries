class UsersController < ApplicationController

  def profile
    @movement = current_user.movements.last
    @meal = current_user.meals.last
    @movements = current_user.movements
    @meals = current_user.meals
    @timeline = @movements + @meals
    @sorted = @timeline.sort_by &:created_at
  end

end
