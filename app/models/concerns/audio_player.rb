class AudioPlayer
  include ActionView::Helpers::TagHelper

  attr_reader :player

  def initialize(options = {})
    if options[:soundcloud_id]
      @player = SoundcloudPlayer.new(options[:soundcloud_id])
    elsif options[:mp3]
      @player = Mp3Player.new(options[:mp3], options[:name])
    end
  end

  def to_html
    player.to_html
  end

end