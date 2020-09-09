class ReviewsController < ApplicationController
    def new
        @review = Review.new
        @bathroom = Bathroom.find(params[:bathroom_id])
    end

    def create
        @bathroom = Bathroom.find(params[:bathroom_id])
        @user = current_user
        @review = Review.new(review_params)
        @review.bathroom = @bathroom
        @review.user = @user
        if @review.save
            flash[:notice] ="🎉 Thank you for reviewing #{@bathroom.name}! 🚽"
            redirect_to bathroom_path(@bathroom)
          else
            render :new
        end
    end

    private
    def review_params
        params.require(:review).permit(:content, :rating)
    end
end
