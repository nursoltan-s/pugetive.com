module IconHelper


  def admin_icon
    awesome_icon('user-md')
  end

  def audio_icon
    foundation_icon('volume')
  end

  def delete_icon
    foundation_icon('x-circle')
  end

  def destroy_icon
    delete_icon
  end

  def env_icon(token = '')
    case token.to_sym
    when :development
      return awesome_icon('laptop')
    when :staging
      return awesome_icon('cloud')
    when :production
      return awesome_icon('cloud')
    else
      return awesome_icon('code-fork')
    end
  end

  def interest_icon(interest)
    if interest.icon.blank?
      return awesome_icon('eye-slash', class: 'subdued')
    end
    awesome_icon(interest.icon)
  end


  def edit_icon
    awesome_icon('edit')
  end

  def external_icon
    awesome_icon('external-link-square')
  end

  def new_icon
    foundation_icon('plus')
  end

  def signin_icon
    foundation_icon('torso')
  end

  def touch_icon
    awesome_icon('hand-pointer-o')
  end

  def email_icon
    foundation_icon('mail')
  end

  def home_icon
    awesome_icon('home')
  end

  def social_icon(token)
    case token.to_sym
    when :facebook
      awesome_icon('facebook-square')
    when :github
      awesome_icon('github')
    when :instagram
      awesome_icon('instagram')
    when :twitter
      awesome_icon('twitter-square')
    when :soundcloud
      awesome_icon('soundcloud')
    end
  end


  def experience_icon
    # foundation_icon('target')
    # awesome_icon('bookmark')
    # awesome_icon('dot-circle-o')
    awesome_icon('circle')
  end

  def star_icon(score)
    stars_html = ''
    1.upto(3) do |index|
      stars_html += content_tag(:span, foundation_icon('record'), class: (index > score) ? 'subdued' : nil)
    end
    raw(stars_html)
  end

  def award_icon
    foundation_icon('trophy')
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

  def print_icon
    foundation_icon('print')
  end

  def project_icon
    foundation_icon('page-multiple')
  end

  def settings_icon
    awesome_icon('cog')
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

  def web_icon
    foundation_icon('web')
  end

  def instagram_icon
    awesome_icon('instagram')
  end

  def flickr_icon
    awesome_icon('flickr')
  end

  def model_icon(token)
    case token.to_sym
    when :genre
      return raw(foundation_icon('pricetag-multiple'))
    when :interest
      return raw(awesome_icon('first-order'))
    when :place
      return raw(foundation_icon('map'))
    when :role
      return raw(foundation_icon('sheriff-badge'))
    when :series
      return raw(awesome_icon('object-group'))
    when :work
      return raw(awesome_icon('list-ul'))
    end
  end

  private

    def awesome_icon(token, options = {})
      raw(fa_icon(token, options.merge(class: 'icon')))
    end

    def foundation_icon(token, options = {})
      content_tag(:i, nil, class: ['icon', "fi-#{token}"])
    end



end
