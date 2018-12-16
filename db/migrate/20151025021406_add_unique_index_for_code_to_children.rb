class AddUniqueIndexForCodeToChildren < ActiveRecord::Migration
  def change
    add_index :children, :code, unique: true
  end
end
