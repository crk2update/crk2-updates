class Sponsorship < ActiveRecord::Base
  belongs_to :sponsor

  def self.load_file(file_name)
    text=File.open(file_name).read
    text.gsub!(/\r\n?/, "\n")
    first = true
    text.each_line do |line|
      begin
      if !first
        cols = line.strip.split("\t")
        sponsor = Sponsor.where(code: cols[1].strip.upcase).first
        r = Sponsorship.new({
          id: cols[0].present? ? cols[0].to_i : nil,
          sponsor_id: sponsor.id,
          sponsor_code: cols[1].present? ? cols[1].strip.upcase : nil,
          school_year: cols[2].present? ? cols[2].to_i : nil,
          number_children: cols[3].present? ? cols[3].to_i : nil,
          dollar_amount: strip_dollar(cols[4]),
          created_at: Time.now,
          updated_at: Time.now
          })
        r.save
        if !r.errors.blank?
          puts r.errors
        end
      end
      first = false
      rescue
        puts line
      end
    end
    nil
  end

  def self.strip_dollar(string)
    return 0 if string.blank?
    string.gsub(/\$/,"").to_i
  end
end
