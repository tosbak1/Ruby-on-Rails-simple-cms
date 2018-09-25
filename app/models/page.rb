class Page < ApplicationRecord
  #db association. class that has belongs_to must have the other classes foreign_key.
  #so create_pages migration file must have index on subject_id
  #You can specify another configuration for foreign key as below
  #belongs_to :subject, {:foreign_key => 'foo_id'}

  belongs_to :subject

  #TO save a page without the parent object (Subject).
  #Do not do this because then you have orphan data in Pages db
  #belongs_to :subject, { :optional => true }

  has_many :sections

  scope :visible, lambda { where(:visible => true)}
  scope :invisible, lambda{ where(:visible => false)}
  scope :sorted, lambda{ order(:position => :asc)}
  scope :newest_first, lambda{ order(:created_at => :desc)}
  #THis is for M:M relationship
  #TO specify the join table if not using rails convention of
  #first_table + _ + second_table both plural and in alphabetical order
  #admin_users_pages for this one then do below:
  #has_and_belongs_to_many :admin_users, :join_table => 'page_admin_users'
  has_and_belongs_to_many :admin_users

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  #use presence_of with length_of to disallow spaces
  validates_uniqueness_of :permalink
  #for unique values by subject use ":scope => :subject_id"
end
