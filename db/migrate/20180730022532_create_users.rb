class CreateUsers < ActiveRecord::Migration[5.0]
=begin
  def change
    create_table :users do |t|

      t.timestamps
    end
  end
=end
  def up
    create_table :users do |t|
      #Column definitions go here. With mysql string will convert to varchar

      #You can use either way below
      #If you do not limit then it becomes => 255 limit
      t.column "first_name", :string, :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :default => '', :null => false
      t.string "password", :limit => 40

      #Special columns that rails automatically populates and updates for us
      #t.datetime "created_at"
      #t.datetime "updated_at"
      #above two commands is the same as t.timestamps
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
