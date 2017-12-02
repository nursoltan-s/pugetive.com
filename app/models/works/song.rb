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


  def self.random(num = 10)
    find(self.random_id(num))
  end

  # REFACTOR move up to Work parent with defined interest_id
  def self.random_id(num)
    if @random_ids.nil?
      sql = <<-SQL
        SELECT id
        FROM works
        WHERE interest_id = #{MUSIC_INTEREST_ID}
      SQL
      @random_ids = ActiveRecord::Base.connection.select_values(sql)
    end
    return @random_ids.sample(num)
  end


end