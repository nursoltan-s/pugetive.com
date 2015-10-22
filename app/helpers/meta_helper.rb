module MetaHelper

  def google_analytics
    if production?
      content = <<-TEXT
      <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', '#{CONFIG[Rails.env][:google_analytics_token]}']);
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

end
