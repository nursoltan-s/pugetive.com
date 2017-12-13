module LinksHelper

  def touch_path(subject)
    "/touch/#{subject.class.name.downcase}/#{subject.id}"
  end

  def photo_link(work, content = "Photo")
    if work.flickr_id.present?
      return flickr_link(work.flickr_id, content)
    elsif work.instagram_id.present?
      return instagram_link(work.instagram_id, content)
    end
  end

  def flickr_link(flickr_id, content = "Flickr #{icon(:flickr)}")
    link_to(raw(content), "https://www.flickr.com/photos/pugetive/#{flickr_id}/", title: "View photograph on Flickr", target: "_blank")
  end

  def instagram_link(instagram_id, content = "Instagram #{icon(:instagram)}")
    link_to(raw(content), "https://www.instagram.com/p/#{instagram_id}", title: "View photograph on Instagram", target: "_blank")
  end

  def resume_path
    "/resume/todd-gehman-resume.pdf"
  end

  def environment_link(token)
    link_to(raw("#{icon(token)} #{token}"),
            request.parameters.except(:controller, :action, :id)
                   .merge(only_path: false,
                          protocol:  host_protocol(token),
                          host:      web_host(token),
                          port:      host_port(token) == 80 ? nil : host_port(token)),
            class: env_class(token) )
  end

  private
    def env_class(token)
      case token.to_sym
      when :development
        return 'alert'
      when :staging
        return 'message'
      when :production
        return 'success'
      end
      nil
    end

end