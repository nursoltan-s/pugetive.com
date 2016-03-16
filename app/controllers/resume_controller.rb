class ResumeController < ApplicationController

  def show
    authorize :resume, :show?

    @todd = Todd.new
  end
end
