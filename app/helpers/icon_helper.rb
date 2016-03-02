module IconHelper

  def delete_icon
    foundation_icon('x-circle')
  end

  def new_icon
    foundation_icon('plus')
  end

  def signin_icon
    foundation_icon('torso')
  end

  def email_icon
    foundation_icon('mail')
  end

  def password_icon
    foundation_icon('key')
  end

  def status_icon
    foundation_icon('wrench')
  end

  def submit_icon
    foundation_icon('play-circle')
  end

  private

    def foundation_icon(token, options = {})
      content_tag(:i, nil, class: ['icon', "fi-#{token}"])
    end


end
