module MetaHelper

  def google_analytics
    if production?
      content = <<-TEXT
      <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', '#{PUGETIVE_CONFIG[Rails.env][:google_analytics_token]}']);
        _gaq.push(['_trackPageview']);

        (function() {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
      </script>
      TEXT
    else
      content = "<!-- GOOGLE ANALYTICS hidden in non-production environments -->"
    end
    raw(content)
  end

  def page_description
    SITE_DESCRIPTION
  end

  def add_html_class(html_class_string_or_array)
    @html_class_list ||= []
    if html_class_string_or_array.is_a?(String)
      @html_class_list << html_class_string_or_array
    elsif html_class_string_or_array.is_a?(Array)
      html_class_string_or_array.each { |html_class| @html_class_list << html_class }
    end
  end

  def html_classes
    add_html_class([Rails.env, params[:controller], "#{params[:controller]}-#{params[:action]}"])
    if params[:debug]
      add_html_class('debug')
    end
    if admin?
      add_html_class('admin')
    end
    if params[:controller] == 'interests' and @interest
      add_html_class(@interest.token)
    end
    @html_class_list
  end

  def title(page_title, show_title = true, hide_suffix = false)
    content_for(:title) { raw(page_title.to_s) }
    @show_title = show_title
    @hide_title_suffix = hide_suffix
  end

  def compound_page_title(title_text)
    rv = ''

    unless production?
      rv << '[' + Rails.env.gsub(/development/, 'dev') + '] '
    end

    unless title_text.blank?
      rv << title_text
      rv << " #{DIVIDER}"
    end
    rv << " " + web_host

    raw(rv)
  end

  def page_rank_icon
    text = <<-TEXT
      <a href="http://www.prchecker.info/" title="PRchecker.info" target="_blank" rel="nofollow">
      <img src="http://pr-v2.prchecker.info/getpr.v2.php?codex=aHR0cDovL3B1Z2V0aXZlLmNvbQ==&tag=1" alt="PRchecker.info" style="border:0;" /></a>
    TEXT
    raw(text)
  end


  def page_url
    "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
  end

  def server_env_hash
    info = request.env
    ENV.each do |key, value|
      info[key] = value
    end
    info
  end


end
