module IconHelper

  def icon(icon_name, options = {})
    begin
      Icon.for(icon_name).to_html
    rescue Exception => e
      raise PugetiveError, "IconHelper#icon failed completely with name #{icon_name}"
    end
  end

  def spinner
    image_tag('icons/spinner.gif')
  end

  def star_icon(score)
    stars_html = ''
    1.upto(3) do |index|
      stars_html += content_tag(:span, icon(:star), class: (index > score) ? 'subdued' : nil)
    end
    raw(stars_html)
  end

  def mobile_icons
    raw(apple_icons + windows_icons + android_icons)
  end


  private


    # <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
    # <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
    # ...etc
    # [[16, 16],
    #  [32, 32],
    #  [57, 57],
    #  [60, 60],
    #  [72, 72],
    #  [76, 76],
    #  [96, 96],
    #  [114, 114],
    #  [144, 144],
    def apple_icons
      links = [favicon_link_tag("icons/favicons/apple-touch-icon.png",
                                rel: 'apple-touch-icon',
                                type: 'image/png')]

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
