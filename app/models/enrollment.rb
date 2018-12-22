class Enrollment < ActiveRecord::Base
  belongs_to :child
  belongs_to :sponsor

  validate do |r|
    if Enrollment.where(child_id: r.child_id, school_year: r.school_year).where.not(id: r.id).exists?
      r.errors[:base] << I18n.t("errors.duplicate")
    end
  end

  ATTENDANCE_ARRAY = ["yes", "no", "sick",
                      "graduated", "university_sponsored", "university_not_sponsored",
                      "out_of_program", "other"]

  # translator is either a view or controller
  def self.attendance_to_code(translator)
    ATTENDANCE_ARRAY.map{|e| [translator.tr("enrollment_attendance." + e), e]}
  end

  def self.code_to_attendance(translator)
    h = {}
    ATTENDANCE_ARRAY.each{|e| h[e] = translator.tr("enrollment_attendance." + e)}
    h
  end


  GRADES_ARRAY = ["pre_kinder", "kinder",
                  "grade1", "grade2", "grade3",
                  "grade4", "grade5", "grade6",
                  "grade7", "grade8", "grade9",
                  "grade10", "grade11", "grade12",
                  "university", "university_grad",
                  "special_needs"]

  # translator is either a view or controller
  def self.grades_to_code(translator)
    GRADES_ARRAY.map{|e| [translator.tr("enrollment_grades." + e), e]}
  end

  def self.code_to_grades(translator)
    h = {}
    GRADES_ARRAY.each{|e| h[e] = translator.tr("enrollment_grades." + e)}
    h
  end

# create the shirt size array from DB - table clothes	
    sql="select cgender, csize,ctype from clothes order by csize ASC"
	results=ActiveRecord::Base.connection.exec_query(sql)
	SHIRT_SIZE_ARRAY_nf = []
	SHIRT_SIZE_ARRAY = []
	SHIRT_SIZE_ARRAY[0]=["", nil]

	index = 0
	results.to_a.select { |x| x["ctype"]=="shirt"}.each do |x|
		SHIRT_SIZE_ARRAY_nf[index]=x
		index=index+1
	end	

  # translator is either a view or controller
  def self.shirt_sizes_to_code(translator,child_id)
	sql="select gender from children where id='" + child_id.to_s + "' limit 1"
	gender=ActiveRecord::Base.connection.exec_query(sql)
	# creating the matrix to shirts based on gender
	gender.to_a.each{ |x| @g=x["gender"] }
	index = 1

	SHIRT_SIZE_ARRAY_nf.select{|sgender| sgender["cgender"] == @g }.each do |x|
		SHIRT_SIZE_ARRAY[index]=[x["csize"],x["cgender"] + '_' + x["csize"]]
		index = index + 1
	end

	SHIRT_SIZE_ARRAY
  end

  def self.get_gender_image(child_id)
	sql="select gender from children where id='" + child_id.to_s + "'"
	results=ActiveRecord::Base.connection.exec_query(sql)
	results.rows.to_s[3..5]
  end
  
  def self.code_to_shirt_sizes(shirt_size)
  x = shirt_size.size
  h={}
  if shirt_size[0..3] == "male"
	h[0] = "male"
	h[1] = shirt_size[5..x]
  else
  	h[0] = "female"
	h[1] = shirt_size[7..x]
  end
	h
	
  end
  
 def self.code_to_cloth_sizes(cloth)
  x = cloth.size
  h={}
  if cloth[0..3] == "male"
	h[0] = "male"
	h[1] = cloth[5..x]
  else
  	h[0] = "female"
	h[1] = cloth[7..x]
  end
	h
	
  end
# create the pant size array from DB - table clothes	
 #   sql="select cgender, csize,ctype from clothes order by csize ASC"
#	results=ActiveRecord::Base.connection.exec_query(sql)
	PANT_SIZE_ARRAY_nf = []
	PANT_SIZE_ARRAY = []
	PANT_SIZE_ARRAY[0]=["", nil]
	index = 0
	results.to_a.select { |x| x["ctype"]=="pant"}.each do |x|
		PANT_SIZE_ARRAY_nf[index]=x
		index=index+1
	end	


  # translator is either a view or controller
  def self.pant_sizes_to_code(translator,child_id)
	sql="select gender from children where id='" + child_id.to_s + "' limit 1"
	gender=ActiveRecord::Base.connection.exec_query(sql)
	# creating the matrix to shirts based on gender
	gender.to_a.each{ |x| @g=x["gender"] }
	index = 1
	PANT_SIZE_ARRAY_nf.select{|sgender| sgender["cgender"] == @g }.each do |x|
		PANT_SIZE_ARRAY[index]=[x["csize"],x["cgender"] + '_' + x["csize"]]
		index = index + 1
	end
  PANT_SIZE_ARRAY

  end

  def self.code_to_pant_sizes(translator)
    h = {}
    PANT_SIZE_ARRAY.each{|e| h[e] = translator.tr("enrollment_pant_sizes." + e)}
    h
  end

  # create the shirt size array from DB - table clothes	
	SHOE_SIZE_ARRAY_nf = []
	SHOE_SIZE_ARRAY = []
	SHOE_SIZE_ARRAY[0]=["", nil]

	index = 0
	results.to_a.select { |x| x["ctype"]=="shoes"}.each do |x|
		SHOE_SIZE_ARRAY_nf[index]=x
		index=index+1
	end	

  # translator is either a view or controller
  def self.shoe_sizes_to_code(translator,child_id)
	sql="select gender from children where id='" + child_id.to_s + "' limit 1"
	gender=ActiveRecord::Base.connection.exec_query(sql)
	# creating the matrix to shirts based on gender
	gender.to_a.each{ |x| @g=x["gender"] }
	index = 1
	SHOE_SIZE_ARRAY_nf.select{|sgender| sgender["cgender"] == @g }.each do |x|
		SHOE_SIZE_ARRAY[index]=[x["csize"],x["cgender"] + '_' + x["csize"]]
		index = index + 1
	end
  SHOE_SIZE_ARRAY

  end

  def self.code_to_shoe_sizes(translator)
    h = {}
    SHOE_SIZE_ARRAY.each{|e| h[e] = translator.tr("enrollment_shoe_sizes." + e)}
    h
  end

  def self.load_file(file_name)
    text=File.open(file_name).read
    text.gsub!(/\r\n?/, "\n")
    first = true
    text.each_line do |line|
      begin
      if !first
        cols = line.strip.split("\t")
        child = Child.where(id: cols[1].strip.to_i).first
        sponsor = Sponsor.where(code: cols[3].strip.upcase).first
        r = Enrollment.new({
          id: cols[0].present? ? cols[0].strip.to_i : nil,
          child_id: child.id,
          school_year: cols[2].present? ? cols[2].strip : nil,
          sponsor_id: sponsor.present? ? sponsor.id : nil,
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

end

