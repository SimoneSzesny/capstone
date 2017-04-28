class StoreSubscriptionsController < ApplicationController
  def create
    storesubscription = StoreSubscription.new(
      user_id: current_user.id,
      store_id: params[:store_id],
    )
    storesubscription.save
    redirect_to "/stores"
  end
end
