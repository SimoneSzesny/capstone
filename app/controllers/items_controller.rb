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

  def index
    @styles = Style.all
    @colors = Color.all
    @items = Item.all
    
    if params[:sort_style].present?
      style = Style.find_by(name: params[:sort_style])
      @items = current_user.items.where(style_id: style.id)
    elsif params[:sort].present?
      color = Color.find_by(name: params[:sort])
      @items = current_user.items.where(color_id: color.id)
    elsif params[:form_name]
      @items = []
      current_user.stores.each do |store|
        store.items.each do |item|
          @items << item
        end
      end
      @items = @items.select { |item| item.name.downcase.include?(params[:form_name].downcase)}
      # @items.where("name ILIKE ?", "%" + params[:form_name] + "%")

      # @items = Item.where("name ILIKE ?", "%" + params[:form_name ] + "%")
    else 
      # @items = Item.all
      @items = []
      current_user.stores.each do |store|
        store.items.each do |item|
          @items << item
        end
      end
      @items
    end
    render "index.html.erb"
  end

  def show
    item_id = params[:id]
    @item = Item.find_by(id: params[:id])
    render "show.html.erb"
  end
end