class Song < Work
  default_scope { music }

  has_one :lyric, foreign_key: :work_id
  has_many :albums, through: :series_works, source: :series, class_name: 'Album'

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


  def self.random(num = 10)
    order("RAND()").limit(num)
  end

end