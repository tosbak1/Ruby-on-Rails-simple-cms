class CreateAdminUsersPagesJoin < ActiveRecord::Migration[5.0]

  def up
    ##change the name of the table to admin_users_pages instead of
    #admin_users_pages_joins for rails convention
    #use :id => false because we are not going to be instantiating this at any point. Just a join table
    create_table :admin_users_pages, :id => false do |t|

      #this is a join so its going to have two foreign keys from admin users and Pages
      t.integer "admin_user_id"
      t.integer "page_id"
    end
    #adding index to the table for the two foreign keys using an array
    add_index("admin_users_pages", ["admin_user_id", "page_id"])

  end

  def down
    drop_table :admin_users_pages
  end
end
