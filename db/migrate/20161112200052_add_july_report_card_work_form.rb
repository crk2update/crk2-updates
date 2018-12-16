class AddJulyReportCardWorkForm < ActiveRecord::Migration
  def change
    add_column :enrollments, :midyear_report_card, :boolean
    add_column :enrollments, :midyear_work_form, :boolean    
  end
end
