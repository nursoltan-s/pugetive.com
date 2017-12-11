class Piece < Work

  has_one :lyric, foreign_key: :work_id

  belongs_to :author, class_name: 'Author'
  has_many :collections, through: :series_works, source: :series, class_name: 'Collection'

  default_scope { includes(:lyric, :genre) }
  # scope :reviews, -> {where(genre_id: 11)}
  # scope :blogs,   -> {where('name LIKE "%typepad%" OR name LIKE "%medium%"')}
  # other projects = all   - @blogs - @reviews - @haiku.map{|s| s.works}.flatten

  def self.blogs
    cached_pieces.select{|piece| piece.blog? }
  end

  def self.reviews
    cached_pieces.select{|piece| piece.genre_id == AMAZON_GENRE_ID}
  end

  def self.haiku
    @haiku ||= Collection.where('name LIKE "%haiku%"').first
  end

  def self.haikus
    self.haiku.pieces
  end

  def self.other_projects
    cached_pieces - blogs - reviews - haikus
  end


  def blog?
    name =~ /blog/i
  end


  private
    def self.cached_pieces
      key = "Piece#cached_pieces:#{self.all.cache_key}"
      Cache.new(key, -> {Piece.all.sorted}).value
    end

end