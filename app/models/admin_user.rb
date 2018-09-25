class AdminUser < ApplicationRecord
  #way to set the table name of this model to another name if this class name remains User
  #self.table_name = "admin_users"

  #THis is for M:M relationship
  #TO specify the join table if not using rails convention of
  #first_table + _ + second_table both plural and in alphabetical order
  #admin_users_pages for this one then do below:
  #has_and_belongs_to_many :admin_users, :join_table => 'page_admin_users'
  has_and_belongs_to_many :pages

  #M:M assocaition RICH
  has_many :section_edits
  #To be able to do me.sections directly
  has_many :sections, :through => :section_edits

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  #i at the end of EMAIL_REGEX shows its case insensitive
  FORBIDDEN_USERNAMES = ['littlebopeep', 'humptydumpty', 'marymary']

=begin
  validates_presence_of :first_name
  validates_length_of :first_name, :maximum => 25
  validates_presence_of :last_name
  validates_length_of :last_name, :maximum => 50
  validates_presence_of :username
  validates_length_of :username, :within => 8..25
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_length_of :email, :maximum => 100
  validates_format_of :email, :with => EMAIL_REGEX
  validates_confirmation_of :email
=end
  validates :first_name, :presence => true,
                        :length => { :maximum => 25 }
  validates :first_name, :presence => true,
                        :length => { :maximum => 50 }
  validates :username, :presence => true,
                      :length => { :within => 8..25 },
                      :uniqueness => true
  validates :email, :presence => true,
                    :length => { :maximum => 100 },
                    :format => { :with => EMAIL_REGEX },
                    :confirmation => true

  validate :username_is_allowed
  validate :no_new_users_on_monday, :on => :create

  private

  def username_is_allowed
    if FORBIDDEN_USERNAMES.include?(username)
      errors.add(:username, "has been restricted from use")
    end
  end

  def no_new_users_on_monday
    if Time.now.wday == 1
      errors.add(:base, "No need users on Mondays.")
    end
  end
end
