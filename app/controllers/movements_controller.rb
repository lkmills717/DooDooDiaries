class MovementsController < ApplicationController
    before_action :set_movement, only: [:show, :edit, :update, :destroy]

    def index
        if params[:query].present?
            @movements = current_user.movements.search_by_feeling_effort_duration_color_smell_and_shape(params[:query])
        else
            @movements = current_user.movements
        end
    end

    def show
    end

    def new
        @movement = Movement.new
    end

    def create
        @user = current_user
        @movement = Movement.new(movement_params)
        @movement.user = @user
        if @movement.save
            flash[:notice] = "🎉You have successfully logged your poop!💩"
            redirect_to movement_path(@movement)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        @movement = Movement.update(movement_params)
        if @movement.save
            redirect_to movement_path(@movement)
        else
            render 'new'
        end
    end

    def destroy
        @movement.destroy
        redirect_to new_movement_path
    end

    def charts
      @movements = current_user.movements
    end

    private
    def movement_params
        params.require(:movement).permit(:id, :feeling, :effort, :duration, :shape, :color, :smell, :comments)
    end

    def set_movement
        @movement = Movement.find(params[:id])
    end
end
