class ResumeController < ApplicationController

  def show
    authorize :resume, :show?

    @emails = Email.all
    @phones = Phone.all
    @addresses = Address.all

    @jobs = Company.all.sort_by{|c| c.start_year}.reverse
    @side_projects = Project.amateur
  end
end
