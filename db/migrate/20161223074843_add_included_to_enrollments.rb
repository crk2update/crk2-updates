class AddIncludedToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :included, :boolean
  end
end
