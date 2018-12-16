class AddNotesToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :notes, :text    
  end
end
