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
end
