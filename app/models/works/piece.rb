class Piece < Work

  has_one :lyric, foreign_key: :work_id

  belongs_to :author, class_name: 'Author'

  default_scope { includes(:lyric) }
  # scope :reviews, -> {where(genre_id: 11)}
  # scope :blogs,   -> {where('name LIKE "%typepad%" OR name LIKE "%medium%"')}
  # other projects = all   - @blogs - @reviews - @haiku.map{|s| s.works}.flatten

  def self.blogs
    cached_pieces.select{|piece| piece.blog? }
  end

  def self.reviews
    cached_pieces.select{|piece| piece.genre_id == AMAZON_GENRE_ID}
  end

# Refactor
  def self.haiku
    Series.where('name LIKE "%haiku%"').first
  end

  def self.haikus
    Series.haiku.works
  end

  def self.other_projects
    # FIXME performance tune this
    where(interest_id: WRITING_INTEREST_ID) - blogs - reviews - haiku.pieces
  end


  def blog?
    name =~ /blog/i
  end


  private
    def self.cached_pieces
      key = "Piece#cached_pieces:#{self.all.cache_key}"
      Cache.new(key, 'all.sorted').value
    end

end