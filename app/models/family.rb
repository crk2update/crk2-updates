class Family < ActiveRecord::Base
  belongs_to :community

  def self.update_name
    Family.all.each do |f|
      #if f.name.blank?
      c = Child.where(family_id: f.id).first
      f.name = c ? "#{c.family_name1} #{c.family_name2}" : f.id
      f.save
      #end
    end
  end

  def self.load_file(file_name)
    text=File.open(file_name).read
    text.gsub!(/\r\n?/, "\n")
    first = true
    text.each_line do |line|
      if !first
        cols = line.split("\t")
        c = Community.where(code: cols[1]).first
        f = Family.new({id: cols[0].to_i, community_id: c.id, notes: cols[2]})
        f.save
        if !f.errors.blank?
          puts f.errors
        end
      end
      first = false
    end
    nil
  end
end
