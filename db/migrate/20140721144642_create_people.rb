class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end
