class AddAttendanceToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :newyear_attendance, :string
    add_column :enrollments, :midyear_attendance, :string
  end
end
