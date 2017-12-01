class Song < Work
  has_one :lyric
  belongs_to :author, class_name: 'Artist'

  def solo?
    party_id == TODD_PARTY_ID or party.alias?
  end

  def has_lyric?
    unless interest_id == MUSIC_INTEREST_ID or
      interest_id == WRITING_INTEREST_ID
      return false
    end
    lyric.present?
  end

  def has_audio?
    soundcloud_id.present?
  end



end