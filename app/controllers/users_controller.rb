class UsersController < ApplicationController

  def profile
    @user = current_user
    @movement = current_user.movements.last
    @meal = current_user.meals.last
    @movements = current_user.movements
    @meals = current_user.meals
    # =begin if params[:start_date] && params[:end_date]
    #   if params[:type] == "Movements"
    #     @movements = @movements.where("created_at > ? and created_at < ?",params[:start_date], params[:end_date])
    #     @meals = []
    #   elsif params[:type] == "Meals"
    #     @meals = @meals.where("created_at > ? and created_at < ?",params[:start_date], params[:end_date])
    #     @movements = []
    #   else
    #     @movements = @movements.where("created_at > ? and created_at < ?",params[:start_date], params[:end_date])
    #     @meals = @meals.where("created_at > ? and created_at < ?",params[:start_date], params[:end_date])
    #   end
    #   @timeline = @movements + @meals
    #   @sorted = @timeline.sort_by &:created_at
    # else =end
      @timeline = @movements + @meals
      @sorted = @timeline.sort_by &:created_at
    # end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path
    else
      render "users/profile"
    end
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end

end
