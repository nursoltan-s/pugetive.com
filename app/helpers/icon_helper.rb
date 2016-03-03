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

  def experience_icon
    foundation_icon('target')
  end

  def star_icon(score)
    stars_html = ''
    1.upto(3) do |index|
      stars_html += content_tag(:span, foundation_icon('star'), class: (index > score) ? 'subdued' : nil)
    end
    raw(stars_html)
  end

  def party_icon
    foundation_icon('torsos-all')
  end

  def password_icon
    foundation_icon('key')
  end

  def phone_icon
    foundation_icon('telephone')
  end

  def project_icon
    foundation_icon('page-multiple')
  end

  def status_icon
    foundation_icon('web')
  end

  def submit_icon
    foundation_icon('play-circle')
  end

  def title_icon
    foundation_icon('torso-business')
  end

  def tool_icon
    foundation_icon('wrench')
  end

  private

    def foundation_icon(token, options = {})
      content_tag(:i, nil, class: ['icon', "fi-#{token}"])
    end


end
