class ReviewsController < ApplicationController
  def create
    @review = Review.new(user_id: current_user.id, item_id: params[:item_id], body: params[:body])
     
     
    if @review.save
      item = Item.find(@review.item.id)
      redirect_to item, notice: "Your review was successfully added"
    else
      render "items/show"
    end
  end
end

