class Child < ActiveRecord::Base
  belongs_to :family
  before_save :analyze_code

  GENDERS_ARRAY = ["male", "female"]
  STATUSES_ARRAY  = ["in_program", "out_of_program", "graduate"]

  # translator is either a view or controller
  def self.gender_to_code(translator)
    GENDERS_ARRAY.map{|e| [translator.tr("child_gender." + e), e]}
  end

  def self.code_to_gender(translator)
    h = {}
    GENDERS_ARRAY.each{|e| h[e] = translator.tr("child_gender." + e)}
    h
  end

  # translator is either a view or controller
  def self.status_to_code(translator)
    STATUSES_ARRAY.map{|e| [translator.tr("child_status." + e), e]}
  end

  def self.code_to_status(translator)
    h = {}
    STATUSES_ARRAY.each{|e| h[e] = translator.tr("child_status." + e)}
    h
  end

  def given_names
    [given_name1, given_name2].compact.join(" ")
  end
  
  def family_names
    [family_name1, family_name2].compact.join(" ")
  end
  
  def analyze_code
    self.derived_community = nil
    self.derived_number = nil

    if self.code.present?
      self.code = self.code.upcase
      match_data = /^([a-zA-Z]*)([0-9]*)$/.match(self.code)
      if match_data && match_data.size == 3
        Rails.logger.debug "derived_community: #{match_data[1]}, derived_number: #{match_data[2]}"
        self.derived_community = match_data[1]
        self.derived_number = match_data[2].to_i
      end
    else
      self.code = "crk-#{SecureRandom::hex(7)}"
    end
  end

  def self.load_file(file_name)
    text=File.open(file_name).read
    text.gsub!(/\r\n?/, "\n")
    first = true
    text.each_line do |line|
      if !first
        cols = line.strip.split("\t")
        f = Family.where(id: cols[2].to_i).first
        c = Child.new({id: cols[0].to_i,
          code: cols[1].present? ? cols[1] : nil,
          family_id: f ? f.id : nil,
          given_name1: cols[3].present? ? cols[3] : nil,
          given_name2: cols[4].present? ? cols[4] : nil,
          family_name1: cols[5].present? ? cols[5] : nil,
          family_name2: cols[6].present? ? cols[6] : nil,
          preferred_name: cols[7].present? ? cols[7] : nil,
          dob: cols[8].present? ? cols[8] : nil,
          status: cols[9] == "1" ? "in_program" : nil,
          gender: cols[10] == "M" ? "male" : nil,
          notes: cols[11].present? ? cols[11] : nil
          })
        c.save
        if !c.errors.blank?
          puts c.errors
        end
      end
      first = false
    end
    nil
  end

  
end