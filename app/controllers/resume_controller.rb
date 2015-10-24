class ResumeController < ApplicationController

  def show
    authorize :resume, :show?
  end
end
