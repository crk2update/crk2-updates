class PopulateNotesInEnrollments < ActiveRecord::Migration
  def change        
    Enrollment.all.each do |enrollment|  
      enrollment.notes = [enrollment.newyear_attendance_notes,
        enrollment.midyear_attendance_notes,
        enrollment.report_notes,
        enrollment.work_form_notes,
        enrollment.pass_notes,
        enrollment.grades_notes
      ].join("\n")
      enrollment.save
    end
  end
end
