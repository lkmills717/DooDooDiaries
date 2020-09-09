class BathroomsController < ApplicationController
    before_action :set_bathroom, only: [:show, :edit, :update, :destroy]

    def index
        @bathrooms = Bathroom.joins(:movements).where("movements.user_id = ?", current_user.id)

        @markers = @bathrooms.geocoded.map do |bathroom|
             {
                 lat: bathroom.latitude,
                 lng: bathroom.longitude,
                 infoWindow: render_to_string(partial: "info_window", locals: { bathroom: bathroom })
             }
         end
    end

    def show
    end

    def new
        @bathroom = Bathroom.new
        @movement = Movement.find(params[:movement_id])
    end

    def create
        @movement = Movement.find(params[:movement_id])
        @user = current_user
        @bathroom = Bathroom.new(bathroom_params)
        @bathroom.movements << @movement
        if @bathroom.save
            @movement.bathroom = @bathroom
            @movement.save
            flash[:notice] = "🎉Thank you for adding your toilet!🚽"
            redirect_to movement_path(@movement)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        @bathroom = Bathroom.update(bathroom_params)
        if @bathroom.save
            redirect_to bathroom_path(@bathroom)
        else
            render 'new'
        end
    end

    def destroy
        @bathroom.destroy
        redirect_to new_bathroom_path
    end

    private
    def bathroom_params
        params.require(:bathroom).permit(:id, :address, :latitude, :longitude, :description, :name)
    end

    def set_bathroom
        @bathroom = Bathroom.find(params[:id])
    end
end
