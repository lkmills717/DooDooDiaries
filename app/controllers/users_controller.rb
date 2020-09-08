class UsersController < ApplicationController

  def profile
    @movement = current_user.movements.last
    @meal = current_user.meals.last
    @movements = current_user.movements
    @meals = current_user.meals
    if params[:start_date] && params[:end_date]
      if params[:type] == "Movements"
        @movements = @movements.where("created_at > ? and created_at < ?",params[:start_date], params[:end_date])
        @meals = []
      elsif params[:type] == "Meals"
        @meals = @meals.where("created_at > ? and created_at < ?",params[:start_date], params[:end_date])
      @movements = []
      elsif  params[:type] == "Meals && Movements"
        @movements = @movements.where("created_at > ? and created_at < ?",params[:start_date], params[:end_date])
        @meals = @meals.where("created_at > ? and created_at < ?",params[:start_date], params[:end_date])
      end
      @timeline = @movements + @meals
      @sorted = @timeline.sort_by &:created_at
    else
      @timeline = @movements + @meals
      @sorted = @timeline.sort_by &:created_at
    end
  end

end
