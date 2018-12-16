class AddGradesToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :newyear_grade, :text    
    add_column :enrollments, :midyear_grade, :text    
  end
end
