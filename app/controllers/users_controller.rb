class UsersController < ApplicationController
  def index
    @users = User.all
    render "index.html.erb"
  end

  def new
    render 'new.html.erb'
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      avatar: params[:avatar]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/stores'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @users_stores = current_user.stores.uniq
    render "show.html.erb"
  end

  def edit
    @user = User.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      avatar: params[:avatar]
    )
      flash[:success] = "Product Updated"
      redirect_to "/users/#{current_user.id}"
    else
      render "edit.html.erb"
    end
  end
end
