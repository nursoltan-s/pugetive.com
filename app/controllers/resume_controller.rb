class ResumeController < ApplicationController

  def show
    authorize :resume, :show?

    @emails = Email.all
    @phones = Phone.all
    @addresses = Address.all

    @jobs = Company.all.sort_by{|c| c.start_year}.reverse
    @side_projects = Project.amateur

    respond_to do |format|
      format.html
      format.pdf do
        options = {pdf:           "Todd Gehman: Resume",
                   layout:        "layouts/pdf.html.haml",
                   template:      "resume/show.pdf.haml"}
        render(options)
      end
    end
  end
end
