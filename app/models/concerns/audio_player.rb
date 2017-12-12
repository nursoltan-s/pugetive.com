class AudioPlayer
  include ActionView::Helpers::TagHelper

  attr_reader :player

  def initialize(subject)
    if subject.respond_to?(:soundcloud_id) and subject.soundcloud_id
      @player = SoundcloudPlayer.new(subject)
    end
  end

  def to_html
    player.to_html
  end

end