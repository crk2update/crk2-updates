class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :community_id
      t.string :community_code
      t.text :notes

      t.timestamps
    end
  end
end
