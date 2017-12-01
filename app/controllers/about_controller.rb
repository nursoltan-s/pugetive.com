class AboutController < ApplicationController
  rescue_from Pundit::NotAuthorizedError, with: :render_unauthorized

  def home
    authorize :about, :home?
    # Interest.live.each do |interest|
    #   instance_variable_set("@#{interest.token}", interest)
    # end
    @todd = Party.find(1)
  end

  def about
    authorize :about, :about?
  end

end
