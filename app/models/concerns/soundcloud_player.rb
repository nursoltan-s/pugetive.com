class SoundcloudPlayer < AudioPlayer

  attr_reader :song

  def initialize(subject)
    @song = subject
  end

  def to_html

    source_path = "https://w.soundcloud.com/player/?" +
                  "url=https%3A//api.soundcloud.com/tracks/#{song.soundcloud_id}&amp;" +
                  "color=ff5500&amp;" +
                  "inverse=false&amp;" +
                  "auto_play=false&amp;" +
                  "show_user=true"

    content_tag(:iframe,
                nil,
                width: "120px",
                height: "20",
                scrolling: "no",
                frameborder: "no",
                src: source_path)
  end

end
