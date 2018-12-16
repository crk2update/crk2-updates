class AddPhotosToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :close_up_photo, :string
    add_column :enrollments, :full_photo, :string
  end
end
