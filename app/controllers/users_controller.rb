class UsersController < ApplicationController

  def profile
    @movement = current_user.movements.last
    @meal = current_user.meals.last
    @movements = current_user.movements
    @meals = current_user.meals
    if params[:query].present?
     @movements = @movements.where("created_at > ?", params[:query])
     @meals = @meals.where("created_at > ?", params[:query])
     @timeline = @movements + @meals
     @sorted = @timeline.sort_by &:created_at
    else
     @timeline = @movements + @meals
     @sorted = @timeline.sort_by &:created_at
    end
  end

end
