class SubjectsController < ApplicationController

  #Set layout to admin.html.erb
  layout 'admin'

  #This is generated easily by running
  #rails generate controller Subjects index show new edit delete
  #create, update and destroy do not have views so they are just added as actions in the class
  def index
    #You can use the subject model to call the scopes
    #@subjects = Subject.all

    #you could write it like @subjects = Subject.order(:position)
    #But we can use the scopes in the subject.rb model as below
    @subjects = Subject.sorted
    #You can render the subject:index view using
    #render('index').
    #But with sensible defaults, We do not have to do that
  end

  def show
    #params[:id] comes from Subject:index view when you click on show
    @subject = Subject.find(params[:id])
  end

  def new
    #This @subject will be passed to the Subject:new view
    #By defining it below, @subject will get any default values even before been set in the view
    #We can also add default values ourselves like this @subject = Subject.new({:name => "Default"})
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    #1) Instantiate a new object using form parameters in Subject:new view

    #Because of mass assignment restrictions, you need to whitelist the values that can be allowed
    #so instead of doing params[:subjects] it becomes
    #params.require(:subject).permit(:name, :position, :Visible)
    #instead of writing this all out over again, make a private method that contains it
    @subject = Subject.new(subject_params)

    #2) Attempt to save the object
    #3) If save succeeds, redirect to the index Actions. Show the whole list
    #4) If save fails, redisplay the form so user can fix problem
    @subject.save ? (flash[:notice] = "Subject created Successfully"; redirect_to(subjects_path)) : (@subject_count = Subject.count + 1; render('new'))
    #render new does not perform the Subject:new action rather it goes to the Subject:new template
    #Subject:new template/view needs an instance variable @subject which it needs from new
    #But the way this is set up, create action also contains a @subject object that can be used
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    #This code is similar to create action.
    #This however needs an existing object.
    @subject = Subject.find(params[:id])
    #Update the object using mass assignment. So call subject.params method
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated Successfully"
      #show the particular record using subject_path(@subject). SO this is show view
      redirect_to(subject_path(@subject))
    else
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])

  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed Successfully"
    redirect_to(subjects_path)
  end


  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end
end
