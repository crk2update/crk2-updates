class CreateFamilyYears < ActiveRecord::Migration
  def change
    create_table :family_years do |t|
      t.integer :community_id
      t.integer :family_id
      t.string :school_year
      t.string :picture
      t.string :notes

      t.timestamps
    end
  end
end
