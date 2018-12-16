class ReportsController < ApplicationController
  before_action :check_permission

  def daily_report
    now = Time.now
    year = params[:year] || now.year.to_s
    text = "<head><meta charset='utf-8'></head>"
    text += "<h1>Coasta Rica Kids Daily Report " + year +"</h1>\n"
    text +="<small><i>" + now.iso8601 + "<i></small>\n"
    communities = Community.all.order(code: :asc)
    communities.each { |community|
      in_program_community_count = 0
      community_count = 0
      community_text = ""
      families = Family.joins(:community).where("communities.code = ?", community.code).order("families.name ASC")
      families.each { |family|
        in_program_family_count = 0
        family_count = 0
        family_text = ""
        children = Child.joins(:family).where("families.id = ?", family.id).order("children.code ASC")
        children.each{ |child|
          enrollment = Enrollment.joins(:child).where("children.id = ? and enrollments.school_year = ?", child.id, year).first
          if enrollment
            family_text += "            " + child.given_names + "; " + child.family_names
            if enrollment.included
              family_text += " (Included)"
              in_program_community_count += 1
              in_program_family_count += 1
            end
            community_count += 1
            family_count += 1
            family_text += "\n"
          end
        }
        family_text = "        " + family.name.to_s + " " + in_program_family_count.to_s + "/" + family_count.to_s + "\n" + family_text
        community_text += family_text
      }
      community_text = "    <h2 style='page-break-before:always;'>" + community.name + " " + in_program_community_count.to_s + "/" + community_count.to_s + "</h2><pre>" + community_text
      community_text += "</pre>"
      text += community_text
    }

    render :text => text, :status=> 200, :content_type => "text/html"
  end

  private
    def check_permission
      return if @user && @user.can_access_reports?
      return head :unauthorized
    end
end
