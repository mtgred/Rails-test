class RegistrationsController < Devise::RegistrationsController
  def new
    @title = 'Sign up'
    render :layout => 'devise'
  end

  def edit
    @title = 'Edit your settings'
    @users = User.where("id NOT IN (?)", current_user.subtree_ids)
  end
end
