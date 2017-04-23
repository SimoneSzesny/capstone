class StoresController < ApplicationController
  def index
    @stores = Store.all
    render "index.html.erb"
  end

  def show
    store_id = params[:id]
    @store = Store.find_by(id: store_id)
    render "show.html.erb"
  end
end
