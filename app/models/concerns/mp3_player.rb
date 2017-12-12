

class Mp3Player < AudioPlayer

  attr_reader :player_id, :audio_file, :audio_name

  def initialize(audio_file, audio_name = nil)
    @audio_file = audio_file
    @audio_name = audio_name

    @player_id = SecureRandom.hex(4)

  end

  def to_html
    html_segment + javascript_segment
  end

  def icon(*args)
    ApplicationController.helpers.icon(*args)
  end

  private



    def html_segment
      <<-HTML
        <div class="jplayer-wrapper">
          <div id="jplayer_#{player_id}" class="jp-jplayer"></div>
          <div id="jp_container_#{player_id}" class="jp-audio" role="application" aria-label="media player">
            <div class="jp-type-single">
              <div class="jp-gui jp-interface">
                <div class="jp-controls-holder">
                  <div class="jp-controls">
                    <button class="jp-play" role="button" tabindex="0">#{icon(:play)}</button>
                    <button class="jp-pause" role="button" tabindex="0">#{icon(:pause)}</button>
                  </div>
                </div>
              </div>
              <div class="jp-details">
                <div class="jp-title" aria-label="title">&nbsp;</div>
              </div>
              <div class="jp-no-solution">
                <span>Update Required</span>
                To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
              </div>
            </div>
          </div>
        </div>
      HTML
    end

    def javascript_segment
      <<-HTML
        <script>
        $(document).ready(function() {

            $("#jplayer_#{player_id}").jPlayer({
                ready: function(event) {
                    $(this).jPlayer("setMedia",
                                    {
                                      title: '#{ audio_name }',
                                      mp3: '#{ audio_file }'
                                     });
                },
                play: function() { // To avoid multiple jPlayers playing together.
                  $(this).jPlayer("pauseOthers");
                },
                swfPath: "http://jplayer.org/latest/dist/jplayer",
                cssSelectorAncestor: "#jp_container_#{player_id}",
                globalVolume: true,
                supplied: "mp3",
                wmode: "window",
                useStateClassSkin: true,
                autoBlur: false,
                smoothPlayBar: true,
                keyEnabled: true,
                remainingDuration: true,
                toggleDuration: true
                });
        });
        </script>
      HTML
    end
end




