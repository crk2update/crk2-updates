class PopulateIncludedInEnrollments < ActiveRecord::Migration
  def change
    Enrollment.all.each do |enrollment|  
      enrollment.included = !(enrollment.not_included)
      enrollment.save
    end
  end
end
