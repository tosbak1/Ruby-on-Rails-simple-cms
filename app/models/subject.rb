class Subject < ApplicationRecord
  #this is for db association 1:1, 1:*, *:*
  #has one is for 1:1 relationship
  #has_one :page

  #for 1:M
  has_many :pages

  #lambdas are used for queries and can be chained together
  scope :visible, lambda { where(:visible => true)}
  scope :invisible, lambda{ where(:visible => false)}
  scope :sorted, lambda{ order(:position => :asc)}
  scope :newest_first, lambda{ order(:created_at => :desc)}

  #using arrays for the where statement because it will be provided by user
  #The %% for query shows that any wildcard can be before and after the query
  scope :search, lambda  {|query|
    where(["name LIKE ?", "%#{query}%"])}
    #Try these scopes in rails console

    #This ensures name cannot be nil, false, "", " ", [] or {}
    #We can also configure the message like this :message => "cannot be blank"
    validates_presence_of :name
    validates_length_of :name, :maximum => 255
end
