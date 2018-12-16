class AddNameToFamily < ActiveRecord::Migration
  def change
    add_column :families, :name, :string 
  end
end
