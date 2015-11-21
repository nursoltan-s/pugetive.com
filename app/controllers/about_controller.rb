class AboutController < ApplicationController
  def home
    authorize :about, :home?
  end

  def edit
    authorize :about, :edit?
    @todd = Todd.new
    if request.post?
      handle_content_params
      redirect_to :edit_todd and return
    end
  end

  private
    def handle_content_params
      [:one_liner, :objective, :summary].each do |token|
        if params[token] and params[token] != @todd.send(token)
          @todd.update(token, params[token])
        end
      end
    end

end
