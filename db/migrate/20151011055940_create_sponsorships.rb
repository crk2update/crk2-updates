class CreateSponsorships < ActiveRecord::Migration
  def change
    create_table :sponsorships do |t|
      t.string :school_year
      t.integer :sponsor_id
      t.string :sponsor_code
      t.integer :number_children
      t.integer :dollar_amount

      t.timestamps
    end
  end
end
