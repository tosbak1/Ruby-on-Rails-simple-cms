class CreatePages < ActiveRecord::Migration[5.0]
  def up
    create_table :pages do |t|
      #subject_id is a foreign key.
      t.integer "subject_id"
      
      t.string "name"
      #permalink is used for looking up pages so needs an index since it is used for lookup
      t.string "permalink"

      t.integer "position"
      t.boolean "visible", :default => false
      t.timestamps
    end
    #always need to add an index for a foreign key
    add_index("pages", "subject_id")
    add_index("pages", "permalink")

  end

  def down
    #no need to drop indexes when dropping the whole table
    drop_table :pages
  end
end
