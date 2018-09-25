class PagesController < ApplicationController

  layout 'admin'

  before_action :find_subjects, :only => [:new, :create, :edit, :update]
  #for find_subjects filter, no need to have @subjects = Subject.sorted anywhere because
  #This filter is available to all actions before they are run so they all have access to @subjects

  before_action :set_page_count, :only => [:new, :create, :edit, :update]
  #set_page_count filter is for       @page_count = Page.count

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    #@page_count = Page.count +1 #now in filter set_page_count
    #@subjects = Subject.sorted #now in filter find_subjects
  end

  def create
    @page = Page.new(page_params)
    @page.save ? (flash[:notice] = "Page created Successfully"; redirect_to(pages_path)) :
    (flash[:notice] = "Page was not created";
       #@page_count = Page.count +1;
       render('new'))
  end

  def edit
    @page = Page.find(params[:id])
    #@page_count = Page.count
    #@subjects = Subject.sorted
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated Successfully"
      #show the particular record using subject_path(@subject). SO this is show view
      redirect_to(page_path(@page))
    else
      flash[:notice] = "Page Not Updated"
      #@page_count = Page.count
      #@subjects = Subject.sorted
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Subject '#{@page.name}' destroyed Successfully"
    redirect_to(pages_path)
  end

  private

  def page_params
    params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
  end

  def find_subjects
    @subjects = Subject.sorted
  end

  def set_page_count
    @page_count = Page.count
    if params[:action] == 'new' || params[:action] == 'create'
      @page_count += 1
    end
  end
end
