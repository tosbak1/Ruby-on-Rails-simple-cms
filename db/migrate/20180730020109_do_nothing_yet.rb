class DoNothingYet < ActiveRecord::Migration[5.0]
  #change is a shorthand for having seperate up and down methods
  #change gives us the flexibility to write only the up code and then rails handles the down part.
  #Not all actions works so might need to explicitly write up and down
=begin
  def change
  end
=end
  #up represents current changes we want to make to the current db
  def up
  end

  #down represents how we want to revert back the db to previous state. Basically undo
  def down
  end
end
