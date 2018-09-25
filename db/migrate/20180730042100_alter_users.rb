class AlterUsers < ActiveRecord::Migration[5.0]
  #def change
  #end

  def up
    rename_table("users", "admin_users")
    add_column("admin_users", "username", :string, :limit => 25, :after => "email")
    change_column("admin_users", "email", :string, :limit => 100)
    rename_column("admin_users", "password", "hashed_password")
    #add index on all foreign keys and also any column which is used frequently
    #for looking up records like username
    #makes look up faster
    puts "********* Adding an Index ******"
    add_index("admin_users", "username")
  end

  def down
    remove_index("admin_users", "username")
    rename_column("admin_users", "hashed_password", "password")
    change_column("admin_users", "email", :string, :default => '', :null => false)
    remove_column("admin_users", "username")
    rename_table("admin_users", "users")
    #add index on all foreign keys and also any column which is used frequently
    #for looking up records like username
    #makes look up faster
  end
end
