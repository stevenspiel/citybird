class ReviewsController < ApplicationController
  def create
    @review = Review.new(create_params)

    if @review.save
      redirect_to :root
    else
      redirect_to :new_user_review_path
    end

  end

  def new
    @reviewee = User.find(params["user_id"])
    @meetup = current_user.visitor_meetups.find_by_ambassador_id(@reviewee.id)
    @rating_options = (1..5).to_a
    @review = Review.new
    redirect_to :new_user_review_path
  end

  def update
  end

  private
  def create_params
    params.require(:review).permit(:rating, :comment)
  end
end
