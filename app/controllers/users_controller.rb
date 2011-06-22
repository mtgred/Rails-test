class UsersController < ApplicationController
  def index
    @users = User.all
    @title = 'Users'
  end

  def show
    @user = User.find(params[:id])
    @title = "#{@user.first_name} #{@user.last_name}"
  end

  def new
    @user = User.new
    @title = "New User"
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
       redirect_to users_url
    else
       render action: "new"
    end
  end

  def destroy_selected
    User.delete_all :id => params[:user_ids]
    redirect_to users_url
  end
end
