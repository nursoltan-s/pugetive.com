class AboutController < ApplicationController
  def home
    authorize :about, :home?
  end
end
