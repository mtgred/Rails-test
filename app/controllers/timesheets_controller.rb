class TimesheetsController < ApplicationController
  # GET /timesheets
  # GET /timesheets.json
  def index
    @timesheets = current_user.timesheets
    @timesheet = Timesheet.new
    @title = "My Timesheets"
    @start_day = Date.today.beginning_of_week 
    @date = params[:month] ? Date.parse(params[:month]) : Date.today

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
    @timesheet = Timesheet.new
    @accounts = Account.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @timesheet }
    end
  end

  # GET /timesheets/1/edit
  def edit
    @timesheet = Timesheet.find(params[:id])
    @accounts = Account.all
    @title = "Edit Time Entry"
  end

  # POST /timesheets
  # POST /timesheets.json
  def create
    days = params[:days].map {|d| d.to_i}
    for d in params[:from].to_date..params[:to].to_date
      if days.include? d.wday
        @timesheet = Timesheet.new params[:timesheet]
        @timesheet.update_attributes :user => current_user, :day => d
        logger.debug @timesheet.attributes.inspect
        error = true unless @timesheet.save
      end
    end

    if error
      @timesheets = current_user.timesheets
      @title = "My Timesheets"
      @start_day = Date.today.beginning_of_week 
      @date = params[:month] ? Date.parse(params[:month]) : Date.today
      render "index" 
    else
      redirect_to timesheets_path 
    end

    #respond_to do |format|
      #if @timesheet.save
        #format.html { redirect_to @timesheet, notice: 'Timesheet was successfully created.' }
        #format.json { render json: @timesheet, status: :created, location: @timesheet }
      #else
        #format.html { render action: "new" }
        #format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PUT /timesheets/1
  # PUT /timesheets/1.json
  def update
    @timesheet = Timesheet.find(params[:id])

    respond_to do |format|
      if @timesheet.update_attributes(params[:timesheet])
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully updated.' }
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
    @start_day = Date.today.beginning_of_week 

    respond_to do |format|
      format.html { render :index }
      format.json { head :ok }
    end
  end
end
