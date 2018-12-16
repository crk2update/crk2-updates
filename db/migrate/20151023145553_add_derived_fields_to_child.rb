class AddDerivedFieldsToChild < ActiveRecord::Migration
  def change
    add_column :children, :derived_community, :string
    add_column :children, :derived_number, :integer 
  end
end
