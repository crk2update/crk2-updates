class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :school_year
      t.integer :child_id
      t.string :child_code
      t.integer :sponsor_id
      t.string :sponsor_code
      t.string :newyear_shirt_size
      t.string :newyear_pant_size
      t.string :newyear_shoe_size
      t.string :midyear_shirt_size
      t.string :midyear_pant_size
      t.string :midyear_shoe_size
      t.integer :newyear_attendance_id
      t.text :newyear_attendance_notes
      t.integer :midyear_attendance_id
      t.text :midyear_attendance_notes
      t.boolean :report_card
      t.text :report_notes
      t.boolean :work_form
      t.text :work_form_notes
      t.boolean :pass
      t.text :pass_notes
      t.string :grades
      t.text :grades_notes
      t.boolean :letter
      t.boolean :not_included

      t.timestamps
    end
  end
end
