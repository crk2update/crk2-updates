class Guardian < ActiveRecord::Base
  belongs_to :family
  RELATIONSHIPS_ARRAY = ["mother", "father", "step_mother",
                         "step_father", "grand_mother", "grand_father",
                         "older_sibling", "other"]

  # translator is either a view or controller
  def self.relationship_to_code(translator)
    RELATIONSHIPS_ARRAY.map{|e| [translator.tr("guardian_relationship." + e), e]}
  end

  def self.code_to_relationship(translator)
    h = {}
    RELATIONSHIPS_ARRAY.each{|e| h[e] = translator.tr("guardian_relationship." + e)}
    h
  end
end
