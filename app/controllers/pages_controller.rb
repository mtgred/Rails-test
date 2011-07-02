class PagesController < ApplicationController
  def home
    @title = 'Dashboard'
  end

  def planning
    @title = 'Planning'
    @users = User.where("department <> ''").order('department, first_name')
                 .group_by {|u| u.department }
    @date = (params[:y] && params[:m]) ? Date.new(params[:y].to_i, params[:m].to_i) : Date.today
    @timesheets = Timesheet.where("extract(MONTH FROM day) = ?", '%02d' % @date.month).order('day').group_by {|t| t.user_id }
    logger.debug @timesheets
  end

  def documentation
    @title = 'Documentation'
  end
end
