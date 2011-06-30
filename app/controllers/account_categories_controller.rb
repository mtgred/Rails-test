class AccountCategoriesController < ApplicationController
  # GET /account_categories
  # GET /account_categories.json
  def index
    @account_categories = AccountCategory.all
    @title = 'Account Categories'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_categories }
    end
  end

  # GET /account_categories/1
  # GET /account_categories/1.json
  def show
    @account_category = AccountCategory.find(params[:id])
    @title = @account_category.name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account_category }
    end
  end

  # GET /account_categories/new
  # GET /account_categories/new.json
  def new
    @account_category = AccountCategory.new
    @title = "New Account Category"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_category }
    end
  end

  # GET /account_categories/1/edit
  def edit
    @account_category = AccountCategory.find(params[:id])
    @title = "Edit"
  end

  # POST /account_categories
  # POST /account_categories.json
  def create
    @account_category = AccountCategory.new(params[:account_category])

    respond_to do |format|
      if @account_category.save
        format.html { redirect_to @account_category, notice: 'Account category was successfully created.' }
        format.json { render json: @account_category, status: :created, location: @account_category }
      else
        @title = "New Account Category"
        format.html { render action: "new" }
        format.json { render json: @account_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /account_categories/1
  # PUT /account_categories/1.json
  def update
    @account_category = AccountCategory.find(params[:id])

    respond_to do |format|
      if @account_category.update_attributes(params[:account_category])
        format.html { redirect_to @account_category, notice: 'Account category was successfully updated.' }
        format.json { head :ok }
      else
        @title = "Edit"
        format.html { render action: "edit" }
        format.json { render json: @account_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_categories/1
  # DELETE /account_categories/1.json
  def destroy
    @account_category = AccountCategory.find(params[:id])
    @account_category.destroy

    respond_to do |format|
      format.html { redirect_to account_categories_url }
      format.json { head :ok }
    end
  end
end
