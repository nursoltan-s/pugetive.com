class Piece < Work
  has_one :lyric, foreign_key: :work_id

  belongs_to :author, class_name: 'Author'

  default_scope { writing }
  scope :reviews, -> {where(genre_id: 11)}
  scope :blogs,   -> {where('name LIKE "%typepad%" OR name LIKE "%medium%"')}
  # other projects = all   - @blogs - @reviews - @haiku.map{|s| s.works}.flatten

  def self.haiku
    Series.haiku
  end

  def self.haikus
    haiku.works
  end

  def self.other_projects
    # FIXME performance tune this
    where(interest_id: WRITING_INTEREST_ID) - blogs - reviews - haiku.pieces
  end

  def self.random(num = 10)
    order("RAND()").limit(num)
  end


  def blog?
    name =~ /blog/i
  end


end