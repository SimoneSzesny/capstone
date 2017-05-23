class StoreSubscriptionsController < ApplicationController
  def create
    storesubscription = StoreSubscription.new(
      user_id: current_user.id,
      store_id: params[:store_id],
    )
    storesubscription.save
    redirect_to "/stores"
  end

  def destroy
    @storesubscription = StoreSubscription.find_by(store_id: params[:id])
    p @storesubscription
    @storesubscription.destroy
    redirect_to "/users/#{current_user.id}"
  end
end
