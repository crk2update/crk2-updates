class PopulateGradesInEnrollments < ActiveRecord::Migration
  def change        
    Enrollment.all.each do |enrollment|  
      enrollment.newyear_grade = enrollment.grades
      enrollment.save
    end
  end
end
