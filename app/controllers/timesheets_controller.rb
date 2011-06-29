class TimesheetsController < ApplicationController
  # GET /timesheets
  # GET /timesheets.json
  def index
    @timesheets = current_user.timesheets
    @timesheet = Timesheet.new
    @title = "My Timesheets"
    @date = (params[:y] and params[:m]) ? Date.new(params[:y].to_i, params[:m].to_i) : Date.today

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timesheets }
    end
  end

  # GET /timesheets/1
  # GET /timesheets/1.json
  def show
    @timesheet = Timesheet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @timesheet }
    end
  end

  # GET /timesheets/new
  # GET /timesheets/new.json
  def new
    @date = Date.new params[:y].to_i, params[:m].to_i, params[:d].to_i
    @title = "Add time entry for #{@date}"
    @timesheet = Timesheet.new :day => @date, :hours => 8
    @accounts = Account.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @timesheet }
    end
  end

  # GET /timesheets/1/edit
  def edit
    @title = "Edit time entry"
    @timesheet = Timesheet.find(params[:id])
    @date = @timesheet.day
    @accounts = Account.all
  end

  # POST /timesheets
  # POST /timesheets.json
  def create
    @timesheet = Timesheet.new params[:timesheet]
    @timesheet.user = current_user
    @date = Date.parse params[:timesheet][:day]
    if @timesheet.save
      redirect_to timesheets_month_path(:y => @date.year, :m => @date.month)
    else
      @title = "Add time entry for #{@date}"
      @accounts = Account.all
      render 'new'
    end
  end

  # PUT /timesheets/1
  # PUT /timesheets/1.json
  def update
    @timesheet = Timesheet.find(params[:id])
    @date = Date.parse params[:timesheet][:day]

    respond_to do |format|
      if @timesheet.update_attributes(params[:timesheet])
        format.html { redirect_to timesheets_month_path(:y => @date.year, :m => @date.month) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.json
  def destroy
    @timesheet = Timesheet.find(params[:id])
    @date = @timesheet.day
    @timesheet.destroy

    @timesheets = current_user.timesheets
    @title = "My Timesheets"

    respond_to do |format|
      format.html { render :index }
      format.json { head :ok }
    end
  end

  def bulk_create
    days = params[:days].map {|d| d.to_i}
    for d in params[:from].to_date..params[:to].to_date
      if days.include? d.wday
        @timesheet = Timesheet.new params[:timesheet]
        @timesheet.update_attributes :user => current_user, :day => d
        error = true unless @timesheet.save
      end
    end

    @date = (params[:y] && params[:m]) ? Date.new(params[:y].to_i, params[:m].to_i) : Date.today
    if error
      @timesheets = current_user.timesheets
      @title = "My Timesheets"
      render "index" 
    else
      redirect_to timesheets_month_path(:y => @date.year, :m => @date.month)
    end
  end
end
