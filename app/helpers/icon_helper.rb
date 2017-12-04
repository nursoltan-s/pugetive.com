ENVIRONMENT_ICONS = {development: 'laptop',
                     staging:     'cloud',
                     production:  'cloud'}

SOCIAL_ICONS = {facebook:   'facebook-square',
                flickr:     'flickr',
                github:     'github',
                instagram:  'instagram',
                linkedin:   'linkedin',
                medium:     'medium',
                twitter:    'twitter-square',
                soundcloud: 'soundcloud'}


module IconHelper



  def admin_icon
    awesome_icon('user-md')
  end

  def audio_icon
    foundation_icon('volume')
  end

  def play_icon
    awesome_icon('play-circle')
  end

  def stop_icon
    awesome_icon('stop-circle')
  end

  def pause_icon
    awesome_icon('pause-circle')
  end


  def delete_icon
    foundation_icon('x-circle')
  end

  def destroy_icon
    delete_icon
  end

  def env_icon(token = '')
    if ENVIRONMENT_ICONS[token.to_sym]
      return awesome_icon(ENVIRONMENT_ICONS[token.to_sym])
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

  def left_icon(options = {})
    awesome_icon('chevron-circle-left', options)
  end

  def right_icon(options = {})
    awesome_icon('chevron-circle-right', options)
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
    awesome_icon(SOCIAL_ICONS[token.to_sym])
  end

  def spinner
    image_tag('icons/spinner.gif')
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

  def mobile_icons
    raw(apple_icons + windows_icons + android_icons)
  end


  private

    def awesome_icon(token, options = {})
      raw(fa_icon(token, options.merge(class: 'icon')))
    end

    def foundation_icon(token, options = {})
      content_tag(:i, nil, class: ['icon', "fi-#{token}"])
    end

    def apple_icons
      # <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
      # <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
      # ...etc
      links = [favicon_link_tag("icons/favicons/apple-touch-icon.png",
                                rel: 'apple-touch-icon',
                                type: 'image/png')]

       # [[16, 16],
       #  [32, 32],
       #  [57, 57],
       #  [60, 60],
       #  [72, 72],
       #  [76, 76],
       #  [96, 96],
       #  [114, 114],
       #  [144, 144],

       [[120, 120],
        [152, 152],
        [180, 180]].each do |size_pair|
          real_dimension = size_pair.first
          size_attr = size_pair.last || real_dimension
          links << favicon_link_tag("icons/favicons/apple-touch-icon-#{real_dimension}x#{real_dimension}.png",
                                    rel:  'apple-touch-icon',
                                    type: 'image/png',
                                    sizes: "#{size_attr}x#{size_attr}")

      end

      links.join("\n")
    end

    def android_icons
      favicon_link_tag("icons/favicons/android-chrome-192x192.png",
                       rel: "icon",
                       type: "image/png",
                       href: "/",
                       sizes: "192x192")


    end

    def windows_icons
      links = []
      links << content_tag(:meta, nil, name: "msapplication-square70x70logo", content: asset_path("icons/favicons/smalltile.png"))
      links << content_tag(:meta, nil, name: "msapplication-square150x150logo", content: asset_path("icons/favicons/mediumtile.png"))
      links << content_tag(:meta, nil, name: "msapplication-wide310x150logo", content: asset_path("icons/favicons/widetile.png"))
      links << content_tag(:meta, nil, name: "msapplication-square310x310logo", content: asset_path("icons/favicons/largetile.png"))
      links.join("\n")
    end



end
