class SectionsController < ApplicationController
  layout 'admin'

  before_action :find_pages, :only => [:new, :create, :edit, :update]
  #for find_subjects filter, no need to have @subjects = Subject.sorted anywhere because
  #This filter is available to all actions before they are run so they all have access to @subjects

  before_action :set_section_count, :only => [:new, :create, :edit, :update]
  #set_page_count filter is for       @page_count = Page.count

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    #@section_count = Section.count + 1
    #@pages = Page.sorted
  end

  def create
    @section = Section.new(section_params)
    @section.save ? (flash[:notice] = "Section created Successfully"; redirect_to(sections_path)) :
    (flash[:notice] = "Section was not created";
      #@section_count = Section.count + 1;
      #@pages = Page.sorted;
      render('new'))
  end

  def edit
    @section = Section.find(params[:id])
    #@section_count = Section.count
    #@pages = Page.sorted
  end

  def update
    @section = Section.find(params[:id])
    @section.update_attributes(section_params) ? (flash[:notice] = "Section updated Successfully"; redirect_to(section_path(@section))) :
    (flash[:notice] = "Section Not Updated";
      #@section_count = Section.count;
      #@pages = Page.sorted;
      render('edit'))
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :content_type, :content, :position, :visible)
  end

  def find_pages
    @pages = Page.sorted
  end

  def set_section_count
    @section_count = Section.count
    if params[:action] == 'new' || params[:action] == 'create'
      @section_count += 1
    end
  end
  
end
