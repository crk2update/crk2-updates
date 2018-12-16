class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :code
      t.integer :family_id
      t.text :notes
      t.string :given_name1
      t.string :given_name2
      t.string :family_name1
      t.string :family_name2
      t.string :preferred_name
      t.date :dob
      t.string :status
      t.string :gender

      t.timestamps
    end
  end
end
