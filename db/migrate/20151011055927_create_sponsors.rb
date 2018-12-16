class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :code
      t.string :donor_number
      t.string :given_name
      t.string :family_name
      t.string :link
      t.string :street_address
      t.string :city
      t.string :postal_code
      t.string :primary_email
      t.string :secondary_email
      t.string :primary_phone
      t.string :secondary_phone

      t.timestamps
    end
  end
end
