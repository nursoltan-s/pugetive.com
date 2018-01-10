class Song < Work

  has_one :lyric, foreign_key: :work_id

  has_many :albums, through: :series_works, source: :series, class_name: 'Album'
  has_many :instruments, through: :wields

  belongs_to :author, class_name: 'Artist'
  belongs_to :key

  scope :classical, -> {where(genre_id: CLASSICAL_GENRE_ID)}

  def solo?
    party_id == TODD_PARTY_ID or party.alias?
  end

  # Refactor OUT
  def has_audio?
    soundcloud_id.present?
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

  def daw
    self.tools.where("name like 'garageband' or name like 'protools'").first
  end

  def audio_player
    @player ||= AudioPlayer.new(soundcloud_id: soundcloud_id).to_html
  end


end