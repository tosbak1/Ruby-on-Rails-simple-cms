#Class is called DemoController and it inherits from ActionController
class DemoController < ApplicationController
  #Method called index which is an action. Action we are asking the controller to perform.
  #It renders a view and also renders a default view layout
  layout false

  attr_accessor :name
  #Good practice to have action defined for each template
  def index
    #by default it is doing render('index')
    #so index action gets called and the template gets set to 'hello' and gets rendered after that
    #render('hello')
    #render is mostly used with if else statements.
  end

  def hello
    @array = [1,2,3,4,5]
    @name="Toyin"
    #@id and @page and @name are the values gotten from the url parameters from action index
    #Can use symble and string for the params argument as below
    @id = params['id']
    @page = params[:page]
    @second_name = @name
    #render('index')
  end

  def other_hello
    #redirect_to(:controller => 'demo', :action => 'index')
    #Since its in the same controller, can just do
    #url changes when you redirect_to
      redirect_to(:controller => 'homepage',:action => 'index')
  end

  def another_hello
    #redirect_to external link
    redirect_to('https://www.instagram.com')
  end

end
