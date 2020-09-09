class MovementsController < ApplicationController
    before_action :set_movement, only: [:show, :edit, :update, :destroy]
    SHAPES = ["https://i.imgur.com/kliYgem.png", "https://i.imgur.com/XDzw3uN.png ", "https://i.imgur.com/uQRhzrV.png", "https://i.imgur.com/CPQNjaP.png", "https://i.imgur.com/9uVW0r5.png", "https://i.imgur.com/yiZLVyf.png", "https://i.imgur.com/mGfzmyJ.png"]


    def index
        if params[:query].present?
            @movements = current_user.movements.search_by_feeling_effort_duration_color_smell_and_shape(params[:query])
        else
            @movements = current_user.movements
        end
    end

    def show
      unless current_user == @movement.user
        redirect_to root_path, notice: "stop looking at other people's stool!"
      end
      @bathroom = Bathroom.new
      if @movement.bathroom
        @markers = [{lat: @movement.bathroom.latitude, lng: @movement.bathroom.longitude}]
      end
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
        params.require(:movement).permit(:id, :feeling, :effort, :duration, :shape, :color, :smell, :comments, :bathroom_id)
    end

    def set_movement
        @movement = Movement.find(params[:id])
    end
end
