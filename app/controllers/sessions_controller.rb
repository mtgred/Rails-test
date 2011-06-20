class SessionsController < Devise::SessionsController
  layout 'devise'

  def new
    @title = 'Log in'
  end
end
