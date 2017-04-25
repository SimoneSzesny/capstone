class ItemsController < ApplicationController
  def new
    @item = Item.new
    render "new.html.erb"
  end
  def create
    @item = Item.new(
      name: params[:name],
      price: params[:price],
      size: params[:size],
      description: params[:description],
      store_id: params[:store_id],
      user_id:params[:user_id],

    )
    if @item.save
      image = Image.new(
        url: params[:image],
        item_id: @item.id
      )
      image.save
      flash[:success] = "Item Created"
      redirect_to "/stores/#{@store.id}"
    else
      render "new.html.erb"
    end
  end
end