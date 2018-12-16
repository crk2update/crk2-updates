class FamilyYear < ActiveRecord::Base
  belongs_to :family

  validate do |r|
    if FamilyYear.where(family_id: r.family_id, school_year: r.school_year).where.not(id: r.id).exists?
      r.errors[:base] << I18n.t("errors.duplicate")
    end
  end
end
