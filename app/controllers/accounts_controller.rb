class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.scoped
    @title = 'Accounts'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])
    @title = @account.name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new
    @accounts = Account.all
    @title = 'New Account'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
    @accounts = Account.where("id NOT IN (?)", @account.subtree_ids)
    @title = 'Edit'
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])
    logger.debug "#{params[:account]}"
    logger.debug "#{@account}"
    @account.ancestry = nil if @account.ancestry.empty?
    @accounts = Account.all

    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_url }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to accounts_url }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :ok }
    end
  end

  def destroy_selected
    Account.delete_all :id => params[:account_ids]
    redirect_to accounts_url
  end
end
