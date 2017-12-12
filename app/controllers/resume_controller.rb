class ResumeController < ApplicationController

  rescue_from Pundit::NotAuthorizedError, with: :render_not_found

  def show

    authorize :resume, :show?

    @todd = Todd.new

    respond_to do |format|
      format.pdf do
        if params[:download]
          handle_pdf_download(options[:pdf])
        else
          render(pdf:      "todd-gehman-resume",
                 template: "resume/show.pdf.haml")
        end
      end
    end

  end


  def blurbs
    authorize :resume, :show?

    @jobs          = [NonProfit.find(23)] + Company.all.sort_by{|c| c.stop_year}.reverse
    @side_projects = App.solo.sorted


  end

  private
    def pdf_options(options = {})
      default = {
        pdf:          "Todd Gehman Resume".parameterize,
        show_as_html: params[:debug].present?,
        footer:       {html: {template: "programs/pdf-footer.html.haml"}},
        margin:       {bottom: 20}
      }
      return default.merge(options)
    end



end
