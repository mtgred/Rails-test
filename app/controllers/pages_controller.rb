class PagesController < ApplicationController
  def home
    @title = 'Dashboard'
  end

  def planning
    @title = 'Planning'
  end

  def documentation
    @title = 'Documentation'
  end
end
