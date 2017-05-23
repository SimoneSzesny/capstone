class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
    # @items = current_user.items
    render "index.json.jbuilder"
  end
end
