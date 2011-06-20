class RegistrationsController < Devise::RegistrationsController
  def new
    @title = 'Sign up'
    render :layout => 'devise'
  end

  def edit
    @title = 'Edit your settings'
  end
end
