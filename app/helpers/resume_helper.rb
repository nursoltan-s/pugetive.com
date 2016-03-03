module ResumeHelper

  def timeline_row(subject, icon)
    Endeavor.new(subject, icon).to_html
  end

end