class ResumeController < ApplicationController

  def show
    authorize :resume, :show?

    @todd = Todd.new

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
