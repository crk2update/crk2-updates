class User < ActiveRecord::Base
  def can_delete_record?
    ["admin", "editor"].include?(role)
  end

  def can_delete_sponsor_record?
    can_access_sponsor?
  end

  def can_access_sponsor?
    ["admin", "accountant"].include?(role)
  end

  def can_access_interview_notes?
    ["admin", "interviewer"].include?(role)
  end
  
  def can_access_reports?
    ["admin"].include?(role)
  end   

  def self.load_file(file_name)
    text=File.open(file_name).read
    text.gsub!(/\r\n?/, "\n")
    first = true
    text.each_line do |line|
      if !first
        cols = line.strip.split("\t")
        u = User.new({
          username: cols[0].present? ? cols[0] : nil,
          hashed_password: cols[1].present? ? cols[1] : nil,
          role: cols[2].present? ? cols[2] : nil,
          })
        u.save
        if !u.errors.blank?
          puts u.errors
        end
      end
      first = false
    end
    nil
  end
end
