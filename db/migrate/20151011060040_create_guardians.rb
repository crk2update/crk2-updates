class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.integer :family_id
      t.string :relationship
      t.integer :relationship_id
      t.boolean :active
      t.boolean :primary
      t.string :given_name1
      t.string :given_name2
      t.string :family_name1
      t.string :family_name2
      t.string :preferred_name
      t.string :primary_phone
      t.string :secondary_phone

      t.timestamps
    end
  end
end
