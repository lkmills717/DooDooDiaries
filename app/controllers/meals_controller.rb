class MealsController < ApplicationController
    before_action :set_meal, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:query].present?
            @meals = current_user.meals.search_by_description(params[:query]).sort_by &:created_at
        else
            @meals = current_user.meals.sort_by &:created_at
        end
    end

    def show
    end

    def new
        @meal = Meal.new
    end

    def create
        @user = current_user
        @meal = Meal.new(meal_params)
        @meal.user = @user
        if @meal.save
            flash[:notice] = "🎉Thank you for recording your meal!🍕Looking forward to seeing what comes out!💩"
            redirect_to meal_path(@meal)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        @meal = Meal.update(meal_params)
        if @meal.save
            redirect_to meal_path(@meal)
        else
            render 'new'
        end
    end

    def destroy
        @meal.destroy
        redirect_to new_meal_path
    end

    private
    def meal_params
        params.require(:meal).permit(:id, :description)
    end

    def set_meal
        @meal = Meal.find(params[:id])
    end
end
