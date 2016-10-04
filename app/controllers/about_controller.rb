class AboutController < ApplicationController

  def home
    authorize :about, :home?
  end

  def about
    authorize :about, :about?
  end

end
