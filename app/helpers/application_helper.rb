module ApplicationHelper
  def friendly_bed_path(bed)
    "/beds/#{bed.code}"
  end
end
