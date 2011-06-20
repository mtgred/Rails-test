class PasswordsController < Devise::PasswordsController
  layout 'devise'

  def new
    @title = 'Reset password'
  end
end
