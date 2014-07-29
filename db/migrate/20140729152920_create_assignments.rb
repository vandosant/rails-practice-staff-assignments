class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments, index: false do |t|
      t.integer :location_id
      t.index :location_id
      t.integer :person_id
      t.index :person_id
      t.string :role
    end
  end
end
