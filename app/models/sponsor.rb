class Sponsor < ActiveRecord::Base
  has_many :sponsorships

  def self.load_file(file_name)
    text=File.open(file_name).read
    text.gsub!(/\r\n?/, "\n")
    first = true
    text.each_line do |line|
      if !first
        cols = line.strip.split("\t")
        r = Sponsor.new({
          id: cols[0].present? ? cols[0].to_i : nil,
          code: cols[1].present? ? cols[1] : nil,
          donor_number: cols[2].present? ? cols[2].to_i : nil,
          given_name: cols[3].present? ? cols[3] : nil,
          family_name: cols[4].present? ? cols[4] : nil,
          link: cols[5].present? ? cols[5] : nil,
          street_address: cols[6].present? ? cols[6] : nil,
          city: cols[7].present? ? cols[7] : nil,
          postal_code: cols[8].present? ? cols[8] : nil,
          primary_email: cols[9].present? ? cols[9] : nil,
          secondary_email: cols[10].present? ? cols[10] : nil,
          primary_phone: cols[11].present? ? cols[11] : nil,
          secondary_phone: cols[12].present? ? cols[12] : nil,
          created_at: Time.now,
          updated_at: Time.now
          })
        r.save
        if !r.errors.blank?
          puts r.errors
        end
      end
      first = false
    end
    nil
  end
end
