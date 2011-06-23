class UsersController < ApplicationController
  def index
    @users = User.scoped
    @title = 'Users'
  end

  def show
    @user = User.find(params[:id])
    @title = @user.full_name
  end

  def new
    @user = User.new
    @users = User.all
    @title = "New User"
  end

  def edit
    @user = User.find(params[:id])
    @users = User.where("id NOT IN (?)", @user.subtree_ids)
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

  def update
    @user = User.find(params[:id])
    puts params
    if @user.update_attributes(params[:user])
      redirect_to users_url
    else
      render action: "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  def destroy_selected
    User.delete_all :id => params[:user_ids]
    redirect_to users_url
  end
end
