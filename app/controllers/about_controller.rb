class AboutController < ApplicationController
  rescue_from Pundit::NotAuthorizedError, with: :render_unauthorized

  def home
    authorize :about, :home?
    @todd = Party.find(TODD_PARTY_ID)
    @interests = Interest.live
    @photos = Photo.random(25)
  end

  def about
    authorize :about, :about?
  end

end
