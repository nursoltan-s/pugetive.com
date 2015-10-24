class ResumeController < ApplicationController

  def show
    authorize :resume, :show?

    @emails = Email.all
    @phones = Phone.all
    @addresses = Address.all
  end
end
