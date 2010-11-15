class CustomisedCrudController < ApplicationController
  
  def index

    @records = @model_class.constantize.all
  end

  def new

    @record = @model_class.constantize.new
    
  end

  def create
    @record = @model_class.constantize.new(params[:blog_post])
    if @record.save!
       flash[:notice] = "Record Created!"
       redirect_to :action => "index" #TODO: Try this -> render index
    else
      flash[:error] = "New record creation failed"
       redirect_to :action => "new"
    end
  end

  def show

    @record = @model_class.constantize.find(params[:id])
  end

  def update
    @record = @model_class.constantize.find(params[:id])
    if @record.update_attributes!(params[:blog_post])
      flash[:notice] = "Record updated"
      render :action => "show", :id => @record.id
    else
      flash[:error] = "Record could not be updated"
      redirect_to :back
    end
  end

  def edit
    #TODO: Get information as to how the fields from the database tables are populated while in edit mode
    @record = @model_class.constantize.find(params[:id])
  end

  def destroy
    @record = @model_class.constantize.find(params[:id])

    if @record != nil    
      @record.destroy
      flash[:notice] = "Record deleted!"
      redirect_to :back
    else
      flash[:error] = "Failed to delete this record"
      redirect_to :back
    end
  end

  def login_required
    if !current_user
      flash[:notice] = "Please login!"
      redirect_to new_session_path
    end
  end
  
end